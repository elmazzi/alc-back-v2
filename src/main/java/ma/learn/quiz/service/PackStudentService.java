package ma.learn.quiz.service;


import ma.learn.quiz.bean.PackStudent;
import ma.learn.quiz.dao.PackStudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class PackStudentService {


    @Autowired
    private PackStudentDao packStudentDao;

    public PackStudent findPackStudentByCode(String code) {
        return packStudentDao.findPackStudentByCode(code);
    }

    public PackStudent findPackStudentByPrix(Double prix) {
        return packStudentDao.findPackStudentByPrix(prix);
    }

    public List<PackStudent> findPackStudentByForGroupe(boolean forgroupe) {
        return packStudentDao.findPackStudentByForGroupe(forgroupe);
    }

    public int save(PackStudent packStudent){
        PackStudent packStudent1 = findPackStudentByCode(packStudent.getCode());
        if (packStudent1!= null){
            return -1;
        }else if (packStudent.getPrix()<=0 || packStudent.getNombreCours() <=0){
            return -2;
        }else {
            PackStudent packStudent2 = new PackStudent();
            packStudent2.setCode(packStudent.getCode());
            packStudent2.setForGroupe(packStudent.isForGroupe());
            packStudent2.setNombreCours(packStudent.getNombreCours());
            packStudentDao.save(packStudent2);
            return 1;
        }
    }

    public int update(PackStudent packStudent){
        PackStudent packStudent1 = findPackStudentByCode(packStudent.getCode());
        if (packStudent1.getPrix()!= packStudent.getPrix()){
            packStudent1.setPrix(packStudent.getPrix());
        }
        if (packStudent1.getNombreCours()!= packStudent.getNombreCours()){
            packStudent1.setNombreCours(packStudent.getNombreCours());
        }
        packStudentDao.save(packStudent1);
        return 1;
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
