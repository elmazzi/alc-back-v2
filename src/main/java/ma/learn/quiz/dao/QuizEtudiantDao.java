package ma.learn.quiz.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.learn.quiz.bean.QuizEtudiant;



@Repository
public interface QuizEtudiantDao extends JpaRepository<QuizEtudiant, Long> {
	QuizEtudiant findByRef(String ref);
	QuizEtudiant findQuizEtudiantById(Long id);
	List<QuizEtudiant> findByEtudiantId(Long id);
	QuizEtudiant findByEtudiantIdAndQuizId(Long idEtudiant, Long idQuiz);
	QuizEtudiant findByEtudiantIdAndQuizRef(Long idEtudiant, String ref);
	void deleteById(Long id);
	List<QuizEtudiant> findByResultat(String resultat);
	List<QuizEtudiant> findByQuizRef(String ref);
	List<QuizEtudiant> findByQuizId(Long id);
	List<QuizEtudiant> findByEtudiantRef(String ref);
	int deleteByQuizRef(String ref);
}