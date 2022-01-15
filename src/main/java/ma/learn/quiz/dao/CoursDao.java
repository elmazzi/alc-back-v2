package ma.learn.quiz.dao;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.learn.quiz.bean.Cours;
import ma.learn.quiz.bean.Parcours;

@Repository
public interface CoursDao extends JpaRepository<Cours, Long> {
	List<Cours> findByLibelle(String libelle);
     Cours findByCode(String code);
     Cours findCoursById(Long id);
     int deleteByCode(String code);
     int deleteCoursById(Long id);
     List<Cours> findByParcoursId(Long id); 
     int deleteByParcoursCode(String code);
     int deleteByParcoursId(Long id);
     Cours findCoursByLibelleAndParcoursId(String coursLibelle, Long idparcours);

}
