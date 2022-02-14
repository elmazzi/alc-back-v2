package ma.learn.quiz.service;


import ma.learn.quiz.bean.Cours;
import ma.learn.quiz.bean.HomeWork;
import ma.learn.quiz.bean.HomeWorkQuestion;
import ma.learn.quiz.bean.Section;
import ma.learn.quiz.dao.HomeWorkDao;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;


@Service
public class HomeWorkService {

    @Autowired
    SectionService sectionService;
    @Autowired
    CoursService coursService;
    @Autowired
    HomeWorkQuestionService homeWorkQuestionService;
    @Autowired
    QuestionService questionService;

    public Optional<HomeWork> findById(Long id) {
        return homeWorkDao.findById(id);
    }

    public HomeWork findHomeWorkById(Long id) {
        return homeWorkDao.findHomeWorkById(id);
    }

    @Transactional
    public void deleteById(Long id) {
        homeWorkDao.deleteById(id);
    }

    public List<HomeWork> findByCoursId(Long id) {
        return homeWorkDao.findByCoursId(id);
    }

    public List<HomeWork> findAll() {
        return homeWorkDao.findAll();
    }

    public HomeWork save(HomeWork homeWork) {
        List<HomeWorkQuestion> questions = homeWork.getQuestions();
        Cours cours = coursService.findCoursById(homeWork.getCours().getId());
        homeWork.setCours(cours);
        if (homeWork.getLibelle() == null) {
            homeWork.setLibelle(cours.getLibelle() + RandomStringUtils.randomNumeric(1));
        }
        homeWorkDao.save(homeWork);
        homeWorkQuestionService.saveHomeWorkQuestion(homeWork, questions);
        homeWork.setQuestions(homeWork.getQuestions());
        return homeWorkDao.save(homeWork);
    }


    @Autowired
    private EntityManager entityManager;

    @Autowired
    private HomeWorkDao homeWorkDao;

}
