package ma.learn.quiz.dao;

import ma.learn.quiz.bean.HomeWorkEtudiant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface HomeWorkEtudiantDao extends JpaRepository<HomeWorkEtudiant, Long> {
	Optional<HomeWorkEtudiant> findById(Long id);
	void deleteById(Long id);
	List<HomeWorkEtudiant> findByEtudiantId(Long id);
	List<HomeWorkEtudiant> findByHomeWorkId(Long id);
	int deleteByEtudiantId(Long id);
	int deleteByHomeWorkId(Long id);
	HomeWorkEtudiant findByIdAndEtudiantId(Long idhomework,Long idstudent);
}