package ma.learn.quiz.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.learn.quiz.bean.CategorieSection;
import ma.learn.quiz.bean.Cours;

@Repository
public interface CategorieSectionDao extends JpaRepository<CategorieSection,Long> {

	CategorieSection findByCode(String code); 
	List<CategorieSection> findByLibelle(String libelle);
     int deleteByCode(String code);
     List<Cours> findBySuperCategorieSectionCode(String code); 
     int deleteBySuperCategorieSectionCode(String code);
     CategorieSection findCategorieSectionById(Long id);
    CategorieSection findCategorieSectionByLibelle(String libelle);

}



