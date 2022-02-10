package ma.learn.quiz.service;

import ma.learn.quiz.bean.NiveauEtude;
import ma.learn.quiz.dao.NiveauEtudeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NiveauEtudeService {
    @Autowired
    private NiveauEtudeDao niveauEtudeDao;
 public int save (NiveauEtude niveauEtude){
     niveauEtudeDao.save(niveauEtude);
     return 1;
    }

    public List<NiveauEtude> findAll() {
        return niveauEtudeDao.findAll();
    }
}
