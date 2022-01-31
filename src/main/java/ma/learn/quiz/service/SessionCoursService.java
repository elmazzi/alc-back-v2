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
import ma.learn.quiz.dao.*;
import ma.learn.quiz.service.Util.UtilString;
import ma.learn.quiz.service.vo.SessionCoursVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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
    private PaiementService paiementService;
    @Autowired
    private ClassAverageBonusService classAverageBonusService;
    @Autowired
    private WorkloadBonusProfService workloadBonusProfService;
    @Autowired
    private WorkloadBonusProfDao workloadBonusProfDao;
    @Autowired
    private ClassAverageBonusProfDao classAverageBonusProfDao;
    @Autowired
    private GroupeEtudiantService groupeEtudiantService;
    @Autowired
    private GroupeEtudiantDao groupeEtudiantDao;

    public List<SessionCours> findByCriteria(SessionCours sessionCours) {
        String query = "SELECT e FROM SessionCours e WHERE 1=1";
        if (sessionCours.getProf().getNom() != null) {
            query += " AND  e.prof.nom LIKE '%" + sessionCours.getProf().getNom() + "%'";
        }
        if (sessionCours.getGroupeEtudiant().getLibelle() != null) {
            query += "  AND  e.groupeEtudiant.libelle LIKE '%" + sessionCours.getGroupeEtudiant().getLibelle() + "'";
        }


        return entityManager.createQuery(query).getResultList();
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


    public int save(Long profid, Long groupEtudiantid, Long coursid) {
        Prof prof1 = profService.findProfById(profid);
        GroupeEtudiant groupeEtudiant = groupeEtudiantService.findGroupeEtudiantById(groupEtudiantid);
        Cours cours = coursService.findCoursById(coursid);
        if (prof1 == null || groupeEtudiant == null || cours == null) {
            return -1;
        } else {
            SessionCours sessionCours = new SessionCours();
            sessionCours.setGroupeEtudiant(groupeEtudiant);
            sessionCours.setDateFin(new Date());
            sessionCours.setReference(generateStringUppercaseAndLowercase(6));
            sessionCours.setPayer(false);
            sessionCours.setProf(prof1);
            sessionCours.setCours(cours);
            sessionCoursDao.save(sessionCours);
            paiementService.save(sessionCours.getId());
            List<SessionCours> sessionCoursList = findByProfId(profid);
            List<WorkloadBonus> workloadBonusList = workloadBonusService.findAll();
            List<ClassAverageBonus> classAverageBonusList = classAverageBonusService.findAll();
            List<SessionCours> sessionCoursList1 = findAllSessionCoursByProfIdAndCurrentDate(profid);
            List<GroupeEtudiant> groupeEtudiants = groupeEtudiantDao.findGroupeEtudiantByProfId(profid);
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
                        //   salary1.setNbrSessionMensuel(new BigDecimal(1));
                        salaryDao.save(salary1);
                    } else {
                        // salary.setNbrSessionMensuel(salary.getNbrSessionMensuel().add(new BigDecimal(1)));
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
            for (ClassAverageBonus classAverageBonus : classAverageBonusList) {
                    int nbr= sessionCoursList1.size()/groupeEtudiants.size();
                    if (classAverageBonus.getNombreSession() == nbr) {
                        LocalDate localDate1 = sessionCours.getDateFin().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                        int month = localDate1.getMonthValue();
                        int annee = localDate1.getYear();
                        Salary salary = salaryService.findSalaryByMoisAndAnneeAndProfId(month, annee, sessionCours.getProf().getId());
                        if (salary == null) {
                            Salary salary1 = new Salary();
                            salary1.setMontantMensuel(classAverageBonus.getPrix());
                            salary1.setMois(month);
                            salary1.setAnnee(annee);
                            salary1.setProf(sessionCours.getProf());
                            // salary1.setNbrSessionMensuel(new BigDecimal(1));
                            salaryDao.save(salary1);
                        } else {
                            //   salary.setNbrSessionMensuel(salary.getNbrSessionMensuel().add(new BigDecimal(1)));
                            salary.setMontantMensuel(salary.getMontantMensuel().add(classAverageBonus.getPrix()));
                            salaryDao.save(salary);
                        }
                        ClassAverageBonusProf classAverageBonusProf = new ClassAverageBonusProf();
                        classAverageBonusProf.setClassAverageBonus(classAverageBonus);
                        classAverageBonusProf.setProf(sessionCours.getProf());
                        classAverageBonusProf.setMois(month);
                        classAverageBonusProf.setAnnee(annee);
                        classAverageBonusProfDao.save(classAverageBonusProf);

                    }
            }
            return 1;
        }
    }


    public List<SessionCours> findAllSessionCoursByProfIdAndCurrentDate(Long idprof) {
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        String month = String.valueOf(localDate.getMonthValue());
        String annee = String.valueOf(localDate.getYear());
        if (month.equals("1") || month.equals("2") || month.equals("3") || month.equals("4") || month.equals("5") || month.equals("6") || month.equals("7") || month.equals("8") || month.equals("9")) {
            String query = "SELECT c FROM SessionCours c WHERE 1=1 AND c.prof.id" + "=" + idprof + " AND c.dateFin LIKE '%" + annee + "-" + '0' + month + "%'";
            return entityManager.createQuery(query).getResultList();

        } else {
            String query = "SELECT c FROM SessionCours c WHERE 1=1 AND c.prof.id" + "=" + idprof + " AND c.dateFin LIKE '%" + annee + "-" + month + "%'";
            return entityManager.createQuery(query).getResultList();

        }

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


}
