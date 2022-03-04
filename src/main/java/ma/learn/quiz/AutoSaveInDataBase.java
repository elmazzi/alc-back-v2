package ma.learn.quiz;

import ma.learn.quiz.bean.TypeDeQuestion;
import ma.learn.quiz.dao.TypeDeQuestionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class AutoSaveInDataBase {
    @PostConstruct
    void save() {
        TypeDeQuestion typeDeQuestion = new TypeDeQuestion();
        typeDeQuestion.setRef("t12");
        typeDeQuestion.setLib("Word By Word");
        if (this.typeDeQuestionDao.findByLib("Word By Word") == null) {
            this.typeDeQuestionDao.save(typeDeQuestion);
        }
    }

    @Autowired
    private TypeDeQuestionDao typeDeQuestionDao;
}
