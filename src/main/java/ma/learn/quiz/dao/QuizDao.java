package ma.learn.quiz.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.learn.quiz.bean.Quiz;


@Repository
public interface QuizDao extends JpaRepository<Quiz, Long> {
    Quiz findByRef(String ref);
    Quiz findQuizById(Long id);
    int deleteByRef(String ref);
    Quiz findBySectionId(Long id);
}