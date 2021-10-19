package ma.learn.quiz.service;


import ma.learn.quiz.bean.HomeWorkQuestion;
import ma.learn.quiz.bean.HoweWorkQSTReponse;
import ma.learn.quiz.dao.HomeWorkQSTReponseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeWorkQSTReponseService {

      @Autowired
      private HomeWorkQSTReponseDao homeWorkQSTReponseDao;

    public List<HoweWorkQSTReponse> findByHomeWorkQuestionId(Long id) {
        return homeWorkQSTReponseDao.findByHomeWorkQuestionId(id);
    }

    public List<HoweWorkQSTReponse> findByEtatReponse(String etatreponse) {
        return homeWorkQSTReponseDao.findByEtatReponse(etatreponse);
    }

    public  int save(HomeWorkQuestion homeWorkQuestion , List<HoweWorkQSTReponse> reponses ){
        int i = 0;
        for ( HoweWorkQSTReponse reponse :reponses){
            reponse.setHomeWorkQuestion(homeWorkQuestion);
            homeWorkQSTReponseDao.save(reponse);
            i++;
        }
        return i;
    }
}
