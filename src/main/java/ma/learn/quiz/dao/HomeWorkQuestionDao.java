package ma.learn.quiz.dao;

import ma.learn.quiz.bean.HomeWork;
import ma.learn.quiz.bean.HomeWorkQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HomeWorkQuestionDao extends JpaRepository<HomeWorkQuestion, Long> {

     List<HomeWorkQuestion> findHomeWorkQuestionByHomeWorkId(Long id);
     HomeWorkQuestion findHomeWorkQuestionByLibelleAndHomeWorkId(String libelle,Long id);
     HomeWorkQuestion findHomeWorkQuestionById(Long id);

     int deleteByRef(String ref);
     int deleteHomeWorkQuestionById(Long id);
     int deleteByHomeWork(HomeWork homeWork);



}
