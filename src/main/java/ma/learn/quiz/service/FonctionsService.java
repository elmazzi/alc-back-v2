package ma.learn.quiz.service;

import ma.learn.quiz.bean.Fonction;
import ma.learn.quiz.bean.NiveauEtude;
import ma.learn.quiz.dao.FonctionDao;
import ma.learn.quiz.dao.NiveauEtudeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FonctionsService {
    @Autowired
    private FonctionDao fonctionDao;

    public List<Fonction> findAll() {
        return fonctionDao.findAll();
    }
}
