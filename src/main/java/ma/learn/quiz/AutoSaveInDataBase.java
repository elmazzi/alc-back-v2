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
        typeDeQuestion.setRef("t13");
        typeDeQuestion.setLib("Drag and Drop");
        if (this.typeDeQuestionDao.findByLib("Drag and Drop") == null) {
            this.typeDeQuestionDao.save(typeDeQuestion);
        }
    }

    @Autowired
    private TypeDeQuestionDao typeDeQuestionDao;
}
