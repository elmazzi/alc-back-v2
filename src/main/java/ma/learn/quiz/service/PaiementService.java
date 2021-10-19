package ma.learn.quiz.service;

import ma.learn.quiz.bean.Admin;
import ma.learn.quiz.bean.Paiement;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.SessionCours;
import ma.learn.quiz.dao.AdminDao;
import ma.learn.quiz.dao.PaiementDao;

import ma.learn.quiz.dao.SessionCoursDao;
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
          Paiement paiement=new Paiement();
          paiement.setDatePaiement(new java.sql.Date(System.currentTimeMillis()+3600*1000*24));
          paiement.setSessionCours(sessionCours);
          sessionCours.setPayer(true);
          paiement.setTotalHeure(sessionCours.getTotalheure());
          paiement.setProf(prof);
          int level=prof.getCategorieProf().getLessonRate().intValue();
          paiement.setMontant(sessionCours.getTotalheure()*level);
          sessionCoursDao.save(sessionCours);
          paiementDao.save(paiement);
          return 1;
      }
    }

    @Autowired
    private PaiementDao paiementDao;
    @Autowired

    private SessionCoursService sessionCoursService;
    @Autowired

    private SessionCoursDao sessionCoursDao;
    @Autowired
    private ProfService profService;
}
