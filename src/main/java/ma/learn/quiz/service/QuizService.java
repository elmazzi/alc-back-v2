package ma.learn.quiz.service;



import ma.learn.quiz.bean.Quiz;
import ma.learn.quiz.bean.Section;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ma.learn.quiz.dao.QuizDao;

@Service
public class QuizService {

    @Autowired
    private QuizDao quizDao;
    @Autowired
    private SectionService sectionService;
    @Autowired
    private ReponseService reponseService;
    public Quiz findBySectionId(Long id) {
		return quizDao.findBySectionId(id);
	}

	@Autowired
    private QuestionService questionService ;

    public void update(Quiz quiz){
        quizDao.save(quiz);
    }

    public Quiz findByRef(String ref) {
        return quizDao.findByRef(ref);
    }


    @Transactional
    public int deleteByRef(String ref) {
       int a= reponseService.deleteByQuestionQuizRef(ref);
       int b= questionService.deleteByQuizRef(ref);
        int c =quizDao.deleteByRef(ref);
        return a+b+c;
    }

    public Quiz findQuizById(Long id) {
        return quizDao.findQuizById(id);
    }

    public List<Quiz> findAll() {
        return quizDao.findAll();
    }

    public int save(Quiz quiz) {
        if (findByRef(quiz.getRef()) != null) {
            return -1;
        } else {
            quizDao.save(quiz);
            return 1;
        }
    }
    public int saveAll(Quiz quiz) {
    	Section section = sectionService.findSectionById(quiz.getSection().getId());	
        if (findByRef(quiz.getRef()) != null) {
            return -1;
        } else {
        	quiz.setLib(section.getCategorieSection().getLibelle());
        	quiz.setSection(section);
            quizDao.save(quiz);
            questionService.saveAll(quiz, quiz.getQuestions());
            return 1;
        }
    }

    public int updateAll(Quiz quiz) {
        Section section = sectionService.findSectionById(quiz.getSection().getId());
        int a= reponseService.deleteByQuestionQuizRef(quiz.getRef());
        int b= questionService.deleteByQuizRef(quiz.getRef());
        int c =quizDao.deleteByRef(quiz.getRef());
        quiz.setLib(section.getCategorieSection().getLibelle());
        quiz.setSection(section);
        quizDao.save(quiz);
        questionService.saveAll(quiz, quiz.getQuestions());
        return 1;
    }


}
