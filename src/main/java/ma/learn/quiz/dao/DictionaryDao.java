package ma.learn.quiz.dao;
import org.springframework.data.jpa.repository.JpaRepository;

import ma.learn.quiz.bean.Dictionary;

import java.util.List;


public interface DictionaryDao extends JpaRepository<Dictionary, Long>  {
	Dictionary findByWord(String word);
	Dictionary findDictionaryById (Long id);
	Dictionary findByWordAndEtudiantId(String word,Long id);
	List<Dictionary> findByEtudiantId(Long id);
	int deleteByWordAndEtudiantId(String word,Long id);

}