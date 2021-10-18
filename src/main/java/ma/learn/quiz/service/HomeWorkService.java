package ma.learn.quiz.service;


import ma.learn.quiz.bean.Cours;
import ma.learn.quiz.bean.HomeWork;
import ma.learn.quiz.bean.Section;
import ma.learn.quiz.dao.HomeWorkDao;
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
    HomeWorkQuestionService homeWorkQuestionService;
    @Autowired
    QuestionService questionService;
    public Optional<HomeWork> findById(Long id) {
        return homeWorkDao.findById(id);
    }

    @Transactional
    public void deleteById(Long id) {
        homeWorkDao.deleteById(id);
    }

    public HomeWork findBySectionId(Long id) {
        return homeWorkDao.findBySectionId(id);
    }

    public List<HomeWork> findAll() {
        return homeWorkDao.findAll();
    }

    public int save(HomeWork homeWork) {
       Section section = sectionService.findSectionById(homeWork.getSection().getId());
       homeWork.setSection(section);
       homeWork.setLibelle(section.getLibelle());
       homeWorkDao.save(homeWork);
       homeWorkQuestionService.saveHomeWorkQuestion(homeWork,homeWork.getQuestions());
       homeWork.setQuestions(homeWork.getQuestions());
       homeWorkDao.save(homeWork);
        return 1;
    }

    public List<HomeWork> findhomeworkbysectioncours(Long id){
        String query="SELECT h FROM HomeWork h WHERE h.section.cours.id="+ id;
        return entityManager.createQuery(query).getResultList();
    }

    @Autowired
    private EntityManager entityManager;

    @Autowired
    private HomeWorkDao homeWorkDao;

}
