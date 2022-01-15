package ma.learn.quiz.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.learn.quiz.bean.CategorieSection;
import ma.learn.quiz.bean.SuperCategorieSection;
@Repository
public interface SuperCategorieSectionDao extends JpaRepository<SuperCategorieSection,Long> {
	SuperCategorieSection findByCode(String code); 
	List<SuperCategorieSection> findByLibelle(String libelle);
    int deleteByCode(String code);
	SuperCategorieSection findSuperCategorieSectionByLibelle(String libelle);

}
