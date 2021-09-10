package ma.learn.quiz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.bean.CategorieProf;
import ma.learn.quiz.dao.CategorieProfDao;

@Service
public class CategorieProfService {
	@Autowired
	private CategorieProfDao categorieProfDao;

	public CategorieProf findCategorieProfById(Long id) {
		return categorieProfDao.findCategorieProfById(id);
	}

	public int deleteCategorieProfById(Long id) {
		return categorieProfDao.deleteCategorieProfById(id);
	}

	public List<CategorieProf> findAll() {
		return categorieProfDao.findAll();
	}
	

}
