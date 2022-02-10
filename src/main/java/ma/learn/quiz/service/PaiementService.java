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


    public int savePaiement(Long idSalary) {
        Salary salary = salaryDao.findSalaryById(idSalary);
        if (salary == null) {
            return -1;
        } else {
            List<SessionCours> sessionCours = sessionCoursDao.findSessionCoursBySalaryId(salary.getId());
            for (SessionCours sessionCours1 : sessionCours) {
                sessionCours1.setPayer(true);
                sessionCours1.getSalary().setPayer(true);
                Paiement paiement = new Paiement();
                paiement.setDatePaiement(new Date());
                paiement.setProf(sessionCours1.getProf());
                paiement.setGroupeEtudiant(sessionCours1.getGroupeEtudiant());
                paiementDao.save(paiement);
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
        String query = "";
        if (mois.equals("1") || mois.equals("2") || mois.equals("3") || mois.equals("4") || mois.equals("5") || mois.equals("6") || mois.equals("7") || mois.equals("8") || mois.equals("9")) {
            query = "SELECT c FROM Paiement c WHERE 1=1 AND c.prof.id" + "=" + profid + " AND c.datePaiement LIKE '%" + annee + "-0" + mois + "%'";
        } else {
            query = "SELECT c FROM Paiement c WHERE 1=1 AND c.prof.id" + "=" + profid + " AND c.datePaiement LIKE '%" + annee + "-" + mois + "%'";
        }
        System.out.println(query);
        return entityManager.createQuery(query).getResultList();


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
    @Autowired
    private GroupeEtudiantService groupeEtudiantService;
}
