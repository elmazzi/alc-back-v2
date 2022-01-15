package ma.learn.quiz.service;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.AdminDao;
import ma.learn.quiz.dao.PaiementDao;

import ma.learn.quiz.dao.SalaryDao;
import ma.learn.quiz.dao.SessionCoursDao;
import ma.learn.quiz.service.Util.UtilString;
import ma.learn.quiz.service.vo.PaiementVo;
import ma.learn.quiz.service.vo.SessionCoursVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.xml.crypto.Data;

@Service
public class PaiementService {


    public List<Paiement> findAll() {
        return paiementDao.findAll();
    }

    public int save(Long idsessioncours) {
        SessionCours sessionCours = sessionCoursService.findSessionCoursById(idsessioncours);
        if (sessionCours == null) {
            return -1;
        } else if (sessionCours.isPayer()) {
            return -2;
        } else {
            Prof prof = profService.findProfById(sessionCours.getProf().getId());
            Etudiant etudiant = etudiantService.findEtudiantById(sessionCours.getEtudiant().getId());
            Paiement paiement = new Paiement();
            paiement.setDatePaiement(new Date());
            paiement.setEtudiant(etudiant);
            sessionCours.setPayer(true);
            paiement.setProf(prof);
            paiement.setMontant(prof.getCategorieProf().getLessonRate());
            sessionCoursDao.save(sessionCours);
            paiementDao.save(paiement);
            LocalDate localDate = paiement.getDatePaiement().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            int month = localDate.getMonthValue();
            int annee = localDate.getYear();
            Salary salary = salaryService.findSalaryByMoisAndAnneeAndProfId(month, annee, paiement.getProf().getId());
            if (salary == null) {
                Salary salary1 = new Salary();
                salary1.setMois(month);
                salary1.setAnnee(annee);
                salary1.setProf(paiement.getProf());
                salary1.setMontantMensuel(prof.getCategorieProf().getLessonRate());
                salary1.setNbrSessionMensuel(new BigDecimal(1));
                salaryDao.save(salary1);
            } else {
                salary.setMontantMensuel(salary.getMontantMensuel().add(paiement.getMontant()));
                salary.setNbrSessionMensuel(salary.getNbrSessionMensuel().add(new BigDecimal(1)));
                salaryDao.save(salary);
            }
            return 1;
        }
    }

    public List<Paiement> findPaiementByProfId(Long id) {
        return paiementDao.findPaiementByProfId(id);
    }

    public List<Paiement> findAllByCriteria(PaiementVo paiementVo) {

        String query = "SELECT c FROM Paiement c WHERE 1=1 ";

        if (UtilString.isnotEmpty(paiementVo.getProf().getNom()))

            query += " AND c.prof.nom LIKE '%" + paiementVo.getProf().getNom() + "%'";
        if (UtilString.isnotEmpty(paiementVo.getEtudiant().getNom()))

            query += " AND c.etudiant.nom LIKE '%" + paiementVo.getEtudiant().getNom() + "%'";
        if (UtilString.isnotEmpty(paiementVo.getDatePaiement()))

            query += " AND c.datePaiement LIKE '%" + paiementVo.getDatePaiement() + "%'";
        System.out.println(query);

        return entityManager.createQuery(query).getResultList();
    }

    public List<Paiement> findPaiementByMoisAndAnneeAndProfID(String mois, String annee, Long profid) {
        String query = "SELECT c FROM Paiement c WHERE 1=1 AND c.prof.id" + "=" + profid + " AND c.datePaiement LIKE '%" + annee + "-" + mois + "%'";
        System.out.println(query);
        return entityManager.createQuery(query).getResultList();
    }

    public BigDecimal findAllPaiementByMoisAndAnneeAndProfID(String mois, String annee, Long profid) {
        List<Paiement> paiements = findPaiementByMoisAndAnneeAndProfID(mois, annee, profid);
        System.out.println("hana tani");
        BigDecimal allpaiement = new BigDecimal(0);
        for (Paiement paiement : paiements) {
            allpaiement = allpaiement.add(paiement.getMontant());
            System.out.println("salaaaaaaaaaaaaaaam");
        }
        return allpaiement;
    }

    @Autowired
    public EntityManager entityManager;
    @Autowired
    private PaiementDao paiementDao;
    @Autowired

    private SessionCoursService sessionCoursService;
    @Autowired

    private SessionCoursDao sessionCoursDao;
    @Autowired
    private ProfService profService;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private SalaryService salaryService;
    @Autowired
    private SalaryDao salaryDao;
}
