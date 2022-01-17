package ma.learn.quiz.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.learn.quiz.bean.Centre;




@Repository
public interface CentreDao extends JpaRepository<Centre,Long> {
	 int deleteByRef(String ref);
		Centre findByRef(String ref);
		Centre findByLibelle(String libelle);
	Centre findCentreByLibelle(String libelle);

}
