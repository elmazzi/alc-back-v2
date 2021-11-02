package ma.learn.quiz.service;

import ma.learn.quiz.bean.HomeWorkEtudiant;
import ma.learn.quiz.bean.ReponseEtudiant;
import ma.learn.quiz.bean.ReponseEtudiantHomeWork;
import ma.learn.quiz.dao.HomeWorkEtudiantDao;
import ma.learn.quiz.dao.ReponseEtudiantDao;
import ma.learn.quiz.dao.ReponseEtudiantHomeWorkDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Optional;


@Service
public class ReponseEtudiantHomeWorkService {

	public Optional<ReponseEtudiantHomeWork> findById(Long id) {
		return reponseEtudiantHomeWorkDao.findById(id);
	}

	@Transactional
	public void deleteById(Long id) {
		reponseEtudiantHomeWorkDao.deleteById(id);
	}


	public List<ReponseEtudiant> findByHomeWorkEtudiantId(Long id) {
		return reponseEtudiantHomeWorkDao.findByHomeWorkEtudiantId(id);
	}

	public List<ReponseEtudiant> findByHomeWorkEtudiantEtudiantId(Long id) {
		return reponseEtudiantHomeWorkDao.findByHomeWorkEtudiantEtudiantId(id);
	}

	public List<ReponseEtudiant> findByHomeWorkEtudiantHomeWorkId(Long id) {
		return reponseEtudiantHomeWorkDao.findByHomeWorkEtudiantHomeWorkId(id);
	}


	@Transactional
	public int deleteByHomeWorkEtudiantId(Long id) {
		return reponseEtudiantHomeWorkDao.deleteByHomeWorkEtudiantId(id);
	}

	@Transactional
	public int deleteByHomeWorkEtudiantEtudiantId(Long id) {
		return reponseEtudiantHomeWorkDao.deleteByHomeWorkEtudiantEtudiantId(id);
	}

	@Transactional
	public int deleteByHomeWorkEtudiantHomeWorkId(Long id) {
		return reponseEtudiantHomeWorkDao.deleteByHomeWorkEtudiantHomeWorkId(id);
	}

	public List<ReponseEtudiantHomeWork> findAll() {
		return reponseEtudiantHomeWorkDao.findAll();
	}

	public int save(HomeWorkEtudiant homeWorkEtudiant, List<ReponseEtudiantHomeWork> reponseEtudiantHomeWork) {

		for (ReponseEtudiantHomeWork reponseEtudiantHomeWork1: reponseEtudiantHomeWork) {
			reponseEtudiantHomeWork1.setHomeWorkEtudiant(homeWorkEtudiant);
			reponseEtudiantHomeWorkDao.save(reponseEtudiantHomeWork1);
		}

		return 1;
	}

	public int update(HomeWorkEtudiant homeWorkEtudiant, List<ReponseEtudiantHomeWork> reponseEtudiantHomeWork){
		int result = reponseEtudiantHomeWorkDao.deleteByHomeWorkEtudiantId(homeWorkEtudiant.getId());
		for (ReponseEtudiantHomeWork reponseEtudiantHomeWork1: reponseEtudiantHomeWork) {
			reponseEtudiantHomeWork1.setHomeWorkEtudiant(homeWorkEtudiant);
			reponseEtudiantHomeWorkDao.save(reponseEtudiantHomeWork1);
		}

		return 1 + result;

	}
	@Autowired
	private ReponseEtudiantHomeWorkDao reponseEtudiantHomeWorkDao;
	@Autowired
	private HomeWorkEtudiantDao homeWorkEtudiantDao;

	@Autowired
    private EntityManager entityManager;
	
	public List<ReponseEtudiantHomeWork> findByCriteria(Long idHomeWorkEtudiant, Long numeroQuestion) {
		String query = "SELECT r FROM ReponseEtudiantHomeWork r WHERE r.homeWorkEtudiant.id= '"+idHomeWorkEtudiant+"' and r.reponse.question.numero='"+numeroQuestion+"'";
		return entityManager.createQuery(query).getResultList();
	}


	public List<ReponseEtudiantHomeWork> findReponseEtudiantHomeWorkByQuestionId(Long id) {
		return reponseEtudiantHomeWorkDao.findReponseEtudiantHomeWorkByQuestionId(id);
	}
}
