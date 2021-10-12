package ma.learn.quiz.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import ma.learn.quiz.bean.EtudiantCours;


public interface EtudiantCoursDao extends JpaRepository<EtudiantCours,Long> {
	EtudiantCours findByCoursIdAndEtudiantId(Long id, Long ids);
	EtudiantCours findEtudiantCoursById(Long id);
	int deleteEtudiantCoursById(Long id);
	List<EtudiantCours> findByProfId(Long id);
	List<EtudiantCours> findByProfIdAndEtudiantId(Long id,Long ids);
EtudiantCours findEtudiantCoursByProfIdAndEtudiantIdAndCoursId(long idprof,long idstudent,long idcours);
}
