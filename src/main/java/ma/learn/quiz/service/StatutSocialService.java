package ma.learn.quiz.service;

import ma.learn.quiz.bean.StatutSocial;
import ma.learn.quiz.dao.StatutSocialDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatutSocialService {
    @Autowired
    private StatutSocialDao statutSocialDao;

    public List<StatutSocial> findAll() {
        return statutSocialDao.findAll();
    }
}
