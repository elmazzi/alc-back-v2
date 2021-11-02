package ma.learn.quiz.service;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.HomeWorkDao;
import ma.learn.quiz.dao.HomeWorkEtudiantDao;
import ma.learn.quiz.dao.QuizEtudiantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Optional;


@Service
public class HomeWorkEtudiantService {

	public Optional<HomeWorkEtudiant> findById(Long id) {
		return homeWorkEtudiantDao.findById(id);
	}

	@Transactional
	public void deleteById(Long id) {
		homeWorkEtudiantDao.deleteById(id);
	}

	public List<HomeWorkEtudiant> findByEtudiantId(Long id) {
		return homeWorkEtudiantDao.findByEtudiantId(id);
	}

	public List<HomeWorkEtudiant> findByHomeWorkId(Long id) {
		return homeWorkEtudiantDao.findByHomeWorkId(id);
	}

	@Transactional
	public int deleteByEtudiantId(Long id) {
		return homeWorkEtudiantDao.deleteByEtudiantId(id);
	}

	@Transactional
	public int deleteByHomeWorkId(Long id) {
		return homeWorkEtudiantDao.deleteByHomeWorkId(id);
	}

	public List<HomeWorkEtudiant> findAll() {
		return homeWorkEtudiantDao.findAll();
	}

	public int save(HomeWorkEtudiant homeWorkEtudiant) {
		HomeWork homeWork = homeWorkDao.findBySectionId(homeWorkEtudiant.getHomeWork().getSection().getId());
        if (homeWorkEtudiant.getEtudiant() == null){
			return -2;
		} else {
        	homeWorkEtudiant.setHomeWork(homeWork);
			homeWorkEtudiantDao.save(homeWorkEtudiant);
			reponseEtudiantHomeWorkService.save(homeWorkEtudiant,homeWorkEtudiant.getReponseEtudiantHomeWork());
			return 1;
		}
	}

	public int update(HomeWorkEtudiant homeWorkEtudiant){
		//HomeWorkEtudiant newhomeWorkEtudiant = homeWorkEtudiantDao.findByIdAndEtudiantId(homeWorkEtudiant.getEtudiant().getId(),homeWorkEtudiant.getId());
		reponseEtudiantHomeWorkService.update(homeWorkEtudiant,homeWorkEtudiant.getReponseEtudiantHomeWork());
		return 1 ;
	}

	@Autowired
		private HomeWorkEtudiantDao homeWorkEtudiantDao;
	@Autowired
	    private HomeWorkDao homeWorkDao;

	@Autowired
	private ReponseEtudiantHomeWorkService reponseEtudiantHomeWorkService;
	@Autowired
		private EntityManager entityManager;


	public HomeWorkEtudiant findByCritere(Long idEtudiant, Long idHomeWork)
	{
		String query = "SELECT h FROM HomeWorkEtudiant h WHERE h.etudiant.id= '"+idEtudiant+"' and h.homeWork.id='"+idHomeWork+"'";
		return (HomeWorkEtudiant) entityManager.createQuery(query).getSingleResult();
	}

}
