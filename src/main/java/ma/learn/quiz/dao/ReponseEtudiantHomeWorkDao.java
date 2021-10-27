package ma.learn.quiz.dao;

import ma.learn.quiz.bean.ReponseEtudiant;
import ma.learn.quiz.bean.ReponseEtudiantHomeWork;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface ReponseEtudiantHomeWorkDao extends JpaRepository<ReponseEtudiantHomeWork, Long> {
	Optional<ReponseEtudiantHomeWork> findById(Long id);
	List<ReponseEtudiantHomeWork> findReponseEtudiantHomeWorkByQuestionId(Long id);
	void deleteById(Long id);
	List<ReponseEtudiant> findByHomeWorkEtudiantId(Long id);
	List<ReponseEtudiant> findByHomeWorkEtudiantEtudiantId(Long id);
	List<ReponseEtudiant> findByHomeWorkEtudiantHomeWorkId(Long id);
	int deleteByHomeWorkEtudiantId(Long id);
	int deleteByHomeWorkEtudiantEtudiantId(Long id);
	int deleteByHomeWorkEtudiantHomeWorkId(Long id);
}