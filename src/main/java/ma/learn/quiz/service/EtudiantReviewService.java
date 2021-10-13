package ma.learn.quiz.service;


import ma.learn.quiz.bean.Cours;
import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.EtudiantReview;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.dao.EtudiantReviewDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public
class EtudiantReviewService {
    @Autowired
    private EtudiantReviewDao etudiantReviewDao;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private ProfService profService ;
    @Autowired
    private CoursService coursService;

    public EtudiantReview findByReview(int review) {
        return etudiantReviewDao.findByReview(review);
    }

    public int deleteByReview(int review) {
        return etudiantReviewDao.deleteByReview(review);
    }

    public List<EtudiantReview> findAll() {
        return etudiantReviewDao.findAll();
    }

    public EtudiantReview findByEtudiantIdAndCoursId(long id, long ids) {
        return etudiantReviewDao.findByEtudiantIdAndCoursId(id, ids);
    }

    public List<EtudiantReview> findEtudiantReviewByProfId(Long id) {
        return etudiantReviewDao.findEtudiantReviewByProfId(id);
    }

    public int save(Long idprof, Long idstudent, Long idcours, String comment) {
        Cours cours=coursService.findCoursById(idcours);
        Etudiant etudiant=etudiantService.findEtudiantById(idstudent);
        Prof prof=profService.findProfById(idprof);
        if (prof==null || etudiant==null) {
            return -1;
        }
        else if(findEtudiantReviewByProfIdAndEtudiantIdAndCoursId(idprof,idstudent,idcours)!=null){
            return -2;
        }else {
            EtudiantReview etudiantReview1=new EtudiantReview();
            etudiantReview1.setEtudiant(etudiant);
            etudiantReview1.setProf(prof);
            etudiantReview1.setComment(comment);
            etudiantReview1.setCours(cours);
            etudiantReview1.setDateReview(new java.sql.Date(System.currentTimeMillis()+3600*1000*24));
             etudiantReviewDao.save(etudiantReview1);
            return 1;
        }
    }

    public EtudiantReview findEtudiantReviewByProfIdAndEtudiantIdAndCoursId(long id, long ids, long idc) {
        return etudiantReviewDao.findEtudiantReviewByProfIdAndEtudiantIdAndCoursId(id, ids, idc);
    }
}
