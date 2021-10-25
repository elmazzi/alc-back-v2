package ma.learn.quiz.service;

import ma.learn.quiz.bean.ReponseEtudiant;
import ma.learn.quiz.bean.ReponseEtudiantHomeWork;
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

	public int save(ReponseEtudiantHomeWork reponseEtudiantHomeWork) {
		reponseEtudiantHomeWorkDao.save(reponseEtudiantHomeWork);
		return 1;
	}

	@Autowired
	private ReponseEtudiantHomeWorkDao reponseEtudiantHomeWorkDao;

	@Autowired
    private EntityManager entityManager;
	
	public List<ReponseEtudiantHomeWork> findByCriteria(Long idHomeWorkEtudiant, Long numeroQuestion) {
		String query = "SELECT r FROM ReponseEtudiantHomeWork r WHERE r.homeWorkEtudiant.id= '"+idHomeWorkEtudiant+"' and r.reponse.question.numero='"+numeroQuestion+"'";
		return entityManager.createQuery(query).getResultList();
	}



	
}
