package ma.learn.quiz.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.learn.quiz.bean.TypeDeQuestion;

import java.util.List;

@Repository
public interface TypeDeQuestionDao extends JpaRepository<TypeDeQuestion, Long> {
    TypeDeQuestion findByRef(String ref);
    int deleteByRef(String ref);
    TypeDeQuestion findByLibIgnoreCase(String lib);
}