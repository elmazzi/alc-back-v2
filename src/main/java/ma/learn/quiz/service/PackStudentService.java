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

    public int save(PackStudent packStudent){
        PackStudent packStudent1 = findPackStudentByCode(packStudent.getCode());
        if (packStudent1!= null){
            return -1;
        }else if (packStudent.getPrix()<=0 || packStudent.getNombreCours() <=0){
            return -2;
        }else if (packStudent.getLibelle() == null || findPackStudentByLibelle(packStudent.getLibelle())!= null ){
            return -3;
        }
        else {
            PackStudent packStudent2 = new PackStudent();
            packStudent2.setCode(packStudent.getCode());
            packStudent2.setForGroupe(packStudent.isForGroupe());
            packStudent2.setNombreCours(packStudent.getNombreCours());
            packStudent2.setPrix(packStudent.getPrix());
            packStudent2.setLibelle(packStudent.getLibelle());
            packStudentDao.save(packStudent2);
            return 1;
        }
    }

    public int update(PackStudent packStudent){
        PackStudent packStudent1 = findPackStudentByCode(packStudent.getCode());
        if (packStudent1 != null) {


            if (packStudent1.getPrix().equals(packStudent.getPrix())) {
                if (packStudent.getPrix() <= 0) {
                    return -1;
                } else {
                    packStudent1.setPrix(packStudent.getPrix());
                }

            }
            if (packStudent1.getNombreCours() != packStudent.getNombreCours()) {
                if (packStudent.getNombreCours() <= 0) {
                    return -2;
                } else {
                    packStudent1.setNombreCours(packStudent.getNombreCours());
                }

            }
            if (packStudent1.getLibelle() != packStudent.getLibelle()) {
                if (findPackStudentByLibelle(packStudent.getLibelle()) != null) {
                    return -3;
                } else {
                    packStudent1.setLibelle(packStudent.getLibelle());
                }
            }
            if (packStudent1.getTotalStudents() != packStudent.getTotalStudents()){
                packStudent1.setTotalStudents(packStudent.getTotalStudents());
            }
            packStudentDao.save(packStudent1);
            return 1;
        }else {
            return -4;
        }

    }

    public List<PackStudent> findbyCriteria(PackStudent packStudent){
        String query = "SELECT p FROM PackStudent p WHERE 1=1 AND p.forGroupe = " + packStudent.isForGroupe();
        if (packStudent.getNombreCours() > 0){
            query+= " AND p.nombreCours = " + packStudent.getNombreCours();
        }
        if (packStudent.getPrix() != null){
            query+= " AND p.prix = " + packStudent.getPrix();
        }
        if (packStudent.getCode() != null && !(packStudent.getCode().isEmpty())){
            query+= " AND p.code LIKE '" + packStudent.getCode() +"'";
        }
        if (packStudent.getTotalStudents() > 0){
            query+= " AND p.totalStudents = " + packStudent.getTotalStudents();
        }
        if (packStudent.getLibelle() != null && !(packStudent.getLibelle().isEmpty())){
            query+= " AND p.libelle LIKE '"+ packStudent.getLibelle() + "'";
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
