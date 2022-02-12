package ma.learn.quiz.service;

import ma.learn.quiz.bean.InteretEtudiant;
import ma.learn.quiz.dao.InteretEtudiantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InteretEtudiantService {
    @Autowired
    private InteretEtudiantDao interetEtudiantDao;

    public List<InteretEtudiant> findAll() {
        return interetEtudiantDao.findAll();
    }
}
