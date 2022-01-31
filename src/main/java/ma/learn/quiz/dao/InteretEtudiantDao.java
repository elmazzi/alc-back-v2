package ma.learn.quiz.dao;

import ma.learn.quiz.bean.InteretEtudiant;
import ma.learn.quiz.bean.StatutSocial;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InteretEtudiantDao extends JpaRepository<InteretEtudiant, Long> {
}
