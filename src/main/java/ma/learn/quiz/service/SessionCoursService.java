package ma.learn.quiz.service;

import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import ma.learn.quiz.bean.Cours;
import ma.learn.quiz.service.Util.UtilString;
import ma.learn.quiz.service.vo.SessionCoursVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.SessionCours;
import ma.learn.quiz.dao.SessionCoursDao;


@Service
public class SessionCoursService {
    @Autowired
    public EntityManager entityManager;
    @Autowired
    private SessionCoursDao sessionCoursDao;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private ProfService profService;
    @Autowired
    private CoursService coursService ;

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

    public List<SessionCours> findByCriteriaCoursName(SessionCoursVO sessionCoursVO){
        String query="SELECT c FROM SessionCours c WHERE 1=1 ";
        if (UtilString.isnotEmpty(sessionCoursVO.getCours().getLibelle()))
            query+=" AND c.cours.libelle LIKE '%"+sessionCoursVO.getCours().getLibelle()+"%'";
        return entityManager.createQuery(query).getResultList();
    }
    public List<SessionCours> findByCriteriaProfName(SessionCoursVO sessionCoursVO){
        String query="SELECT c FROM SessionCours c WHERE 1=1 ";
        if (UtilString.isnotEmpty(sessionCoursVO.getProf().getNom()))
            query+=" AND c.prof.nom LIKE '%"+sessionCoursVO.getProf().getNom()+"%'";
        return entityManager.createQuery(query).getResultList();
    }
    public List<SessionCours> findByCriteriaStudentName(SessionCoursVO sessionCoursVO){
        String query="SELECT c FROM SessionCours c WHERE 1=1 ";
        if (UtilString.isnotEmpty(sessionCoursVO.getEtudiant().getNom()))
            query+=" AND c.etudiant.nom LIKE '%"+sessionCoursVO.getEtudiant().getNom()+"%'";
        return entityManager.createQuery(query).getResultList();
    }
    public List<SessionCours> findByCriteriaReference(SessionCoursVO sessionCoursVO){
        String query="SELECT c FROM SessionCours c WHERE 1=1 ";
        if (UtilString.isnotEmpty(sessionCoursVO.getReference()))
            query+=" AND c.reference LIKE '%"+sessionCoursVO.getReference()+"%'";
        return entityManager.createQuery(query).getResultList();
    }
    public List<SessionCours> findByCriteriaDate(SessionCoursVO sessionCoursVO){
        String query="SELECT c FROM SessionCours c WHERE 1=1 ";
        if (UtilString.isnotEmpty(sessionCoursVO.getDateFin()))
            query+=" AND c .dateFin = '"+sessionCoursVO.getDateFin()+"'";
        return entityManager.createQuery(query).getResultList();
    }

    public SessionCours findSessionCoursById(Long id) {
        return sessionCoursDao.findSessionCoursById(id);
    }


    /*
        public int save(SessionCours sessionCours) {
            SessionCours session = findSessionCoursById(sessionCours.getId());
            Etudiant etd = etudiantService.findEtudiantById(sessionCours.getEtudiant().getId());
            Prof prof = profService.findProfById(sessionCours.getProf().getId());
            if (findSessionCoursById(sessionCours.getId()) != null) {
                return -1;
            } else {
                SessionCours sessionCours1 = new SessionCours();
                sessionCours1.setProf(prof);
                sessionCours1.setDateFin(session.getDateFin());
                sessionCours1.setReference(session.getReference());
                sessionCours1.setPayer(false);
                sessionCours1.setEtudiant(etd);

                sessionCoursDao.save(sessionCours1);
                return 1;
            }
        }
    */
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
        Cours cours=coursService.findCoursById(coursid);
        SessionCours session=findSessionCoursByCoursIdAndEtudiantIdAndProfId(coursid,etudiantid,profid);
        if (prof1 == null || etudiant1 == null || cours==null) {
            return -1;
        }
        else if(session!=null && !session.isPayer()){
            session.setTotalheure(session.getTotalheure()+1);
            sessionCoursDao.save(session);
            return 2;
        }
        else{
            SessionCours sessionCours=new SessionCours();
            sessionCours.setEtudiant(etudiant1);
            sessionCours.setDateFin(new java.sql.Date(System.currentTimeMillis()+3600*1000*24));
            sessionCours.setReference(generateStringUppercaseAndLowercase(6));
            sessionCours.setPayer(false);
            sessionCours.setProf(prof1);
            sessionCours.setTotalheure(1);
            sessionCours.setCours(cours);
            sessionCoursDao.save(sessionCours);
            return 1;
        }
    }


    public List<SessionCours> findByProfIdAndEtudiantId(Long id, Long ids) {
        return sessionCoursDao.findByProfIdAndEtudiantId(id, ids);
    }

    public int update(SessionCours sessionCours) {
        SessionCours session = findSessionCoursById(sessionCours.getId());

        if (session == null) {
            return -1;
        } else {
            session.setPayer(true);
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
