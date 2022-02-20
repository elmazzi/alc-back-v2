package ma.learn.quiz.service;
import ma.learn.quiz.bean.InteretEtudiant;
import ma.learn.quiz.bean.Skill;
import ma.learn.quiz.dao.SkillDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.List;
@Service
public class SkillService {
    @Autowired
    private SkillDao skillDao;
    public List<Skill> findAll() {
        return skillDao.findAll();
    }
}
