package ma.learn.quiz.service;


import ma.learn.quiz.bean.PackStudent;
import ma.learn.quiz.dao.PackStudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;

@Service
public class PackStudentService {


    @Autowired
    private PackStudentDao packStudentDao;
    @Autowired
    private EntityManager entityManager;


    public List<PackStudent> findAll() {
        return packStudentDao.findAll();
    }

    public PackStudent findPackStudentByCode(String code) {
        return packStudentDao.findPackStudentByCode(code);
    }

    public PackStudent findPackStudentByPrix(Double prix) {
        return packStudentDao.findPackStudentByPrix(prix);
    }

    public List<PackStudent> findPackStudentByForGroupe(boolean forgroupe) {
        return packStudentDao.findPackStudentByForGroupe(forgroupe);
    }

    public PackStudent findPackStudentByLibelle(String libelle) {
        return packStudentDao.findPackStudentByLibelle(libelle);
    }

    public List<PackStudent> findByTotalStudents(int totalStudents) {
        return packStudentDao.findByTotalStudents(totalStudents);
    }

    public PackStudent save(PackStudent packStudent) throws Exception {
        PackStudent packStudent1 = findPackStudentByCode(packStudent.getCode());
        if (packStudent1 != null) {
            throw new Exception("Code already exist");
        } else if (packStudent.getPrix() <= 0 || packStudent.getNombreCours() <= 0) {
            throw new Exception("Number of courses can't be null");
        }
       return packStudentDao.save(packStudent);
    }

    public PackStudent update(PackStudent packStudent) {
            return packStudentDao.save(packStudent);
    }

    public List<PackStudent> findbyCriteria(PackStudent packStudent) {
        String query = "SELECT p FROM PackStudent p WHERE 1=1 AND p.forGroupe = " + packStudent.isForGroupe();
        if (packStudent.getNombreCours() > 0) {
            query += " AND p.nombreCours = " + packStudent.getNombreCours();
        }
        if (packStudent.getPrix() != null) {
            query += " AND p.prix = " + packStudent.getPrix();
        }
        if (packStudent.getCode() != null && !(packStudent.getCode().isEmpty())) {
            query += " AND p.code LIKE '" + packStudent.getCode() + "'";
        }
        if (packStudent.getTotalStudents() > 0) {
            query += " AND p.totalStudents = " + packStudent.getTotalStudents();
        }
        if (packStudent.getLibelle() != null && !(packStudent.getLibelle().isEmpty())) {
            query += " AND p.libelle LIKE '" + packStudent.getLibelle() + "'";
        }
        return entityManager.createQuery(query).getResultList();
    }

    @Transactional
    public int deleteByCode(String code) {
        return packStudentDao.deleteByCode(code);
    }

    @Transactional
    public int deleteByPrix(Double prix) {
        return packStudentDao.deleteByPrix(prix);
    }

    @Transactional
    public int deleteByForGroupe(boolean forGroupe) {
        return packStudentDao.deleteByForGroupe(forGroupe);
    }
}
