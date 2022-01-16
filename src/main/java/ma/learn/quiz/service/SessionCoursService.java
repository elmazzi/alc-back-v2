package ma.learn.quiz.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.SalaryDao;
import ma.learn.quiz.dao.WorkloadBonusProfDao;
import ma.learn.quiz.service.Util.UtilString;
import ma.learn.quiz.service.vo.SessionCoursVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.dao.SessionCoursDao;


@Service
public class SessionCoursService extends AbstractService {
    @Autowired
    public EntityManager entityManager;
    @Autowired
    private SessionCoursDao sessionCoursDao;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private ProfService profService;
    @Autowired
    private CoursService coursService;
    @Autowired
    private SalaryService salaryService;
    @Autowired
    private SalaryDao salaryDao;
    @Autowired
    private WorkloadBonusService workloadBonusService;
    @Autowired
    private ClassAverageBonusService classAverageBonusService;
    @Autowired
    private WorkloadBonusProfService workloadBonusProfService;
    @Autowired
    private WorkloadBonusProfDao workloadBonusProfDao;

    public List<SessionCours> findByCriteria(SessionCours sessionCours) {
        String query = "SELECT e FROM SessionCours e WHERE 1=1";
        if (sessionCours.getProf().getNom() != null) {
            query += " AND  e.prof.nom LIKE '%" + sessionCours.getProf().getNom() + "%'";
        }
        if (sessionCours.getEtudiant().getNom() != null) {
            query += "  AND  e.etudiant.nom LIKE '%" + sessionCours.getEtudiant().getNom() + "'";
        }


        return entityManager.createQuery(query).getResultList();
    }

    public List<SessionCours> findByEtudiantId(Long id) {
        return sessionCoursDao.findByEtudiantId(id);
    }

    public List<SessionCours> findAllByCriteria(SessionCoursVO sessionCoursVO) {
        String query = this.init("SessionCours");
        if (sessionCoursVO.getEtudiant() != null) {
            query += this.addCriteria("etudiant.nom", sessionCoursVO.getEtudiant().getNom(), "LIKE");
        }
        if (sessionCoursVO.getReference() != null) {
            query += this.addCriteria("reference", sessionCoursVO.getReference(), "LIKE");
        }
        if (sessionCoursVO.getDateFin() != null) {
            query += this.addCriteria("dateFin", sessionCoursVO.getDateFin(), "LIKE");
        }
        if (sessionCoursVO.getCours().getLibelle() != null) {
            query += this.addCriteria("cours.libelle", sessionCoursVO.getCours().getLibelle(), "LIKE");
        }
        if (sessionCoursVO.getProf().getNom() != null) {
            query += this.addCriteria("prof.nom", sessionCoursVO.getProf().getNom(), "LIKE");
        }
        System.out.println("query = " + query);


        return entityManager.createQuery(query).getResultList();


    }


    public SessionCours findSessionCoursById(Long id) {
        return sessionCoursDao.findSessionCoursById(id);
    }


    public static String generateStringUppercaseAndLowercase(int len) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++)
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        return sb.toString();
    }

    public SessionCours findSessionCoursByCoursIdAndEtudiantIdAndProfId(Long idc, Long ids, Long idp) {
        return sessionCoursDao.findSessionCoursByCoursIdAndEtudiantIdAndProfId(idc, ids, idp);
    }

    public int save(Long profid, Long etudiantid, Long coursid) {
        Prof prof1 = profService.findProfById(profid);
        Etudiant etudiant1 = etudiantService.findEtudiantById(etudiantid);
        Cours cours = coursService.findCoursById(coursid);
        if (prof1 == null || etudiant1 == null || cours == null) {
            return -1;
        } else {
            SessionCours sessionCours = new SessionCours();
            sessionCours.setEtudiant(etudiant1);
            sessionCours.setDateFin(new Date());
            sessionCours.setReference(generateStringUppercaseAndLowercase(6));
            sessionCours.setPayer(false);
            sessionCours.setProf(prof1);
            sessionCours.setCours(cours);
            sessionCoursDao.save(sessionCours);
            List<SessionCours> sessionCoursList = findByProfId(profid);
            List<WorkloadBonus> workloadBonusList = workloadBonusService.findAll();
            List<ClassAverageBonus> classAverageBonusList = classAverageBonusService.findAll();
            for (WorkloadBonus workloadBonus : workloadBonusList) {
                if (workloadBonus.getNombreSession() == sessionCoursList.size()) {

                    LocalDate localDate = sessionCours.getDateFin().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                    int month = localDate.getMonthValue();
                    int annee = localDate.getYear();
                    Salary salary = salaryService.findSalaryByMoisAndAnneeAndProfId(month, annee, sessionCours.getProf().getId());
                    if (salary == null) {
                        Salary salary1 = new Salary();
                        salary1.setMontantMensuel(workloadBonus.getPrix());
                        salary1.setMois(month);
                        salary1.setAnnee(annee);
                        salary1.setProf(sessionCours.getProf());
                        salary1.setNbrSessionMensuel(new BigDecimal(1));
                        salaryDao.save(salary1);
                    } else {
                        salary.setNbrSessionMensuel(salary.getNbrSessionMensuel().add(new BigDecimal(1)));
                        salary.setMontantMensuel(salary.getMontantMensuel().add(workloadBonus.getPrix()));
                        salaryDao.save(salary);
                    }
                    WorkloadBonusProf workloadBonusProf = new WorkloadBonusProf();
                    workloadBonusProf.setWorkloadBonus(workloadBonus);
                    workloadBonusProf.setProf(sessionCours.getProf());
                    workloadBonusProf.setMois(month);
                    workloadBonusProf.setAnnee(annee);
                    workloadBonusProfDao.save(workloadBonusProf);
                }
            }

            return 1;
        }
    }

    public List<SessionCours> findAllSessionCoursByProfIdAndCurrentMonth(Long idprof,int month,int annee) {
        String query = "SELECT c FROM SessionCours c WHERE 1=1 AND c.prof.id" + "=" + idprof + " AND c.dateFin LIKE '%" + annee + "-" + month + "%'";
        return entityManager.createQuery(query).getResultList();
    }

    public List<SessionCours> findByProfIdAndEtudiantId(Long id, Long ids) {
        return sessionCoursDao.findByProfIdAndEtudiantId(id, ids);
    }

    public int update(Long id) {
        SessionCours session = findSessionCoursById(id);
        if (session == null) {
            return -1;
        } else {
            session.setPayer(false);
            sessionCoursDao.save(session);
            return 1;
        }
    }

    public List<SessionCours> findByProfId(Long id) {
        return sessionCoursDao.findByProfId(id);
    }

    public List<SessionCours> findAll() {
        return sessionCoursDao.findAll();
    }


    @Transactional
    public int deleteSessionCoursById(Long id) {
        return sessionCoursDao.deleteSessionCoursById(id);
    }


    @Transactional
    public int deleteSessionCoursById(List<SessionCours> sessionCourss) {
        int res = 0;
        for (int i = 0; i < sessionCourss.size(); i++) {
            res += deleteSessionCoursById(sessionCourss.get(i).getId());
        }
        return res;
    }

    public SessionCours findSessionCoursByProfNom(String nom) {
        return sessionCoursDao.findSessionCoursByProfNom(nom);
    }

    public List<SessionCours> findSessionCoursByEtudiantId(Long id) {
        return sessionCoursDao.findSessionCoursByEtudiantId(id);
    }
}
