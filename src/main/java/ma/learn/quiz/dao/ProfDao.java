package ma.learn.quiz.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.RecommendTeacher;

@Repository
public interface ProfDao extends JpaRepository<Prof, Long> {
    Prof findByNumero(String ref);
    Prof findByNom(String nom);
    Prof findByLogin(String login);
    Prof findProfById(Long id);
    int deleteByNumero(String ref);
    Prof findByRef(String ref);
     int deleteByRef(String ref);
    int deleteProfById(Long id);
}