package ma.learn.quiz.service;

import java.util.List;

import ma.learn.quiz.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.dao.EtudiantCoursDao;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

@Service
public class EtudiantCoursService {
    @Autowired
    public EntityManager entityManager;
    @Autowired
    private EtudiantCoursDao etudiantCoursDao;
    @Autowired
    private CoursService coursService;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private ProfService profService;

    public EtudiantCours findByCoursIdAndEtudiantId(Long id, Long ids) {
        return etudiantCoursDao.findByCoursIdAndEtudiantId(id, ids);
    }


    public List<EtudiantCours> findAll() {
        return etudiantCoursDao.findAll();
    }

    public EtudiantCours findEtudiantCoursById(Long id) {
        return etudiantCoursDao.findEtudiantCoursById(id);
    }

    public EtudiantCours update(EtudiantCours sessionCours) {
        EtudiantCours session = findEtudiantCoursById(sessionCours.getId());
        Etudiant etd = etudiantService.findEtudiantById(sessionCours.getEtudiant().getId());
        Prof prof = profService.findProfById(sessionCours.getProf().getId());
        session.setEtudiant(etd);
        session.setProf(prof);
       // session.setDateDebut(sessionCours.getDateDebut());
        session.setDateFin(sessionCours.getDateFin());
        return etudiantCoursDao.save(session);
    }

    /*	public int save(EtudiantCours etudiantCours) {
            Etudiant etd = etudiantService.findEtudiantById(etudiantCours.getEtudiant().getId());
            Cours cours = coursService.findCoursById(etudiantCours.getCours().getId());
            EtudiantCours etdcours = findByCoursIdAndEtudiantId(cours.getId(), etd.getId());
            Prof prof = profService.findProfById(etd.getProf().getId());

            if (etd == null) {
                return -1;
            }else if (etdcours != null) {
                return -2;
            } else if (cours == null) {
                return -3;
            }else {
                etudiantCours.setProf(prof);
                etudiantCoursDao.save(etudiantCours);
                return 1;
            }
        }*/
    public int save(Long idprof, Long idetudiant, Long idcours) {
        Prof prof = profService.findProfById(idprof);
        Etudiant etudiant = etudiantService.findEtudiantById(idetudiant);
        Cours cours = coursService.findCoursById(idcours);
        if (prof == null || etudiant == null || cours == null) {
            return -1;
        }else if(findEtudiantCoursByProfIdAndEtudiantIdAndCoursId(idprof,idetudiant,idcours)!=null)
        {
            return -2;
        }
        else {
            EtudiantCours etudiantCours=new EtudiantCours();
            etudiantCours.setEtudiant(etudiant);
            etudiantCours.setProf(prof);
            etudiantCours.setPayer(false);
            etudiantCours.setCours(cours);
            etudiantCours.setDateFin(new java.sql.Date(System.currentTimeMillis()+3600*1000*24));
            etudiantCoursDao.save(etudiantCours);
            return 1;
        }
    }

    public List<EtudiantCours> findByCriteria(EtudiantCours sessionCours) {
        String query = "SELECT e FROM EtudiantCours e WHERE 1=1";
        if (sessionCours.getProf().getNom() != null) {
            query += " AND  e.prof.nom LIKE '%" + sessionCours.getProf().getNom() + "%'";
        }
        if (sessionCours.getEtudiant().getNom() != null) {
            query += "  AND  e.etudiant.nom LIKE '%" + sessionCours.getEtudiant().getNom() + "'";
        }


        return entityManager.createQuery(query).getResultList();
    }

    public List<EtudiantCours> findByProfId(Long id) {
        return etudiantCoursDao.findByProfId(id);
    }

    @Transactional
    public int deleteEtudiantCoursById(Long id) {
        return etudiantCoursDao.deleteEtudiantCoursById(id);
    }

    @Transactional
    public int deleteSessionCoursById(List<EtudiantCours> sessionCourss) {
        int res = 0;
        for (int i = 0; i < sessionCourss.size(); i++) {
            res += deleteEtudiantCoursById(sessionCourss.get(i).getId());
        }
        return res;
    }

    public List<EtudiantCours> findByProfIdAndEtudiantId(Long id, Long ids) {
        return etudiantCoursDao.findByProfIdAndEtudiantId(id, ids);
    }

    public EtudiantCours findEtudiantCoursByProfIdAndEtudiantIdAndCoursId(long idprof, long idstudent, long idcours) {
        return etudiantCoursDao.findEtudiantCoursByProfIdAndEtudiantIdAndCoursId(idprof, idstudent, idcours);
    }
}
