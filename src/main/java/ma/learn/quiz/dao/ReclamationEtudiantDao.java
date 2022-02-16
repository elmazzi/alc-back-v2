package ma.learn.quiz.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

import ma.learn.quiz.bean.ReclamationEtudiant;


@Repository
public interface ReclamationEtudiantDao extends JpaRepository<ReclamationEtudiant, Long> {

ReclamationEtudiant findReclamationEtudiantById(Long id);

}
