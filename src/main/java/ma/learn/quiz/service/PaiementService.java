package ma.learn.quiz.service;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.AdminDao;
import ma.learn.quiz.dao.PaiementDao;

import ma.learn.quiz.dao.SessionCoursDao;
import ma.learn.quiz.service.Util.UtilString;
import ma.learn.quiz.service.vo.PaiementVo;
import ma.learn.quiz.service.vo.SessionCoursVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.persistence.EntityManager;

@Service
public class PaiementService {


    public List<Paiement> findAll() {
        return paiementDao.findAll();
    }

    public int save(Long idsessioncours) {
      SessionCours sessionCours= sessionCoursService.findSessionCoursById(idsessioncours);
      if (sessionCours==null){
          return -1;
      }else if(sessionCours.isPayer()){
          return -2;
      }
      else {
          Prof prof=profService.findProfById(sessionCours.getProf().getId());
          Etudiant etudiant=etudiantService.findEtudiantById(sessionCours.getEtudiant().getId());
          Paiement paiement=new Paiement();
          paiement.setDatePaiement(new java.sql.Date(System.currentTimeMillis()+3600*1000*24));
          paiement.setEtudiant(etudiant);
          sessionCours.setPayer(true);
          paiement.setProf(prof);
          int level=prof.getCategorieProf().getLessonRate().intValue();
          sessionCoursDao.save(sessionCours);
          paiementDao.save(paiement);
          return 1;
      }
    }

    public List<Paiement> findPaiementByProfId(Long id) {
        return paiementDao.findPaiementByProfId(id);
    }
    public List<Paiement> findAllByCriteria(PaiementVo paiementVo) {

        String query = "SELECT c FROM Paiement c WHERE 1=1 ";

        if (UtilString.isnotEmpty(paiementVo.getProf().getNom()))

            query += " AND c.prof.nom LIKE '%" + paiementVo.getProf().getNom()+ "%'";
        if (UtilString.isnotEmpty(paiementVo.getEtudiant().getNom()))

            query += " AND c.etudiant.nom LIKE '%" + paiementVo.getEtudiant().getNom()+ "%'";
        if (UtilString.isnotEmpty(paiementVo.getDatePaiement()))

            query += " AND c.datePaiement LIKE '%" + paiementVo.getDatePaiement()+ "%'";
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
}
