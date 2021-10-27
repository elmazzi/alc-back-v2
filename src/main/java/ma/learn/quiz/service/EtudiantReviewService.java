package ma.learn.quiz.service;


import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.EtudiantReviewDao;
import ma.learn.quiz.service.Util.UtilString;
import ma.learn.quiz.service.vo.EtudiantReviewVo;
import ma.learn.quiz.service.vo.SessionCoursVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.List;

@Service
public
class EtudiantReviewService {
    @Autowired
    private EtudiantReviewDao etudiantReviewDao;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private ProfService profService;
    @Autowired
    private CoursService coursService;
    @Autowired
    public EntityManager entityManager;

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
        Cours cours = coursService.findCoursById(idcours);
        Etudiant etudiant = etudiantService.findEtudiantById(idstudent);
        Prof prof = profService.findProfById(idprof);
        if (prof == null || etudiant == null || cours == null) {
            return -1;
        } else if (findEtudiantReviewByProfIdAndEtudiantIdAndCoursId(idprof, idstudent, idcours) != null) {
            return -2;
        }
        {
            EtudiantReview etudiantReview1 = new EtudiantReview();
            etudiantReview1.setEtudiant(etudiant);
            etudiantReview1.setProf(prof);
            etudiantReview1.setComment(comment);
            etudiantReview1.setCours(cours);
             etudiantReview1.setDateReview(new java.sql.Date(System.currentTimeMillis() + 3600 * 1000 * 24));
             etudiantReviewDao.save(etudiantReview1);
            return 1;
        }
    }

    public EtudiantReview findEtudiantReviewByProfIdAndEtudiantIdAndCoursId(long id, long ids, long idc) {
        return etudiantReviewDao.findEtudiantReviewByProfIdAndEtudiantIdAndCoursId(id, ids, idc);
    }

    public List<EtudiantReview> findByCriteria(EtudiantReviewVo etudiantReviewVo) {
        String query = "SELECT c FROM EtudiantReview c WHERE 1=1 ";
        if (UtilString.isnotEmpty(etudiantReviewVo.getEtudiant().getNom()))
            query += " AND c.etudiant.nom LIKE '%" + etudiantReviewVo.getEtudiant().getNom() + "%'";
        if (UtilString.isnotEmpty(etudiantReviewVo.getCours().getLibelle()))
            query += " AND c.cours.libelle LIKE '%" + etudiantReviewVo.getCours().getLibelle() + "%'";
        if (UtilString.isnotEmpty(etudiantReviewVo.getDateReview()))
            query += " AND c.dateReview LIKE '%" + etudiantReviewVo.getDateReview() + "%'";
        return entityManager.createQuery(query).getResultList();
    }


}
