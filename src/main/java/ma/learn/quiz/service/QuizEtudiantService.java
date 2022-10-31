package ma.learn.quiz.service;

import java.util.List;

import javax.persistence.EntityManager;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ma.learn.quiz.bean.Cours;
import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.Parcours;
import ma.learn.quiz.bean.Quiz;
import ma.learn.quiz.bean.QuizEtudiant;
import ma.learn.quiz.dao.QuizEtudiantDao;


@Service
public class QuizEtudiantService {

	@Autowired
	private QuizEtudiantDao quizEtudiantDao;
	public List<QuizEtudiant> findByResultat(String resultat) {
		return quizEtudiantDao.findByResultat(resultat);
	}

	@Autowired
	private QuizService quizService;
	@Autowired
	private EtudiantService etudiantService;
	@Autowired
	private ReponseEtudiantService reponseEtudiantService;
	@Autowired 
	public EntityManager entityManager;

	public QuizEtudiant findByRef(String ref) {
		return quizEtudiantDao.findByRef(ref);
	}

	@Transactional
	public int deleteById(Long id) {
		int reponseEtudiant = reponseEtudiantService.deleteByQuizEtudiantId(id);
		quizEtudiantDao.deleteById(id);
		return reponseEtudiant+1;
	}

	public List<QuizEtudiant> findByQuizRef(String ref) {
		return quizEtudiantDao.findByQuizRef(ref);
	}

	public List<QuizEtudiant> findByQuizId(Long id) {
		return quizEtudiantDao.findByQuizId(id);
	}

	@Transactional
	public int deleteByQuizRef(String ref) {
		return quizEtudiantDao.deleteByQuizRef(ref);
	}

	public QuizEtudiant findQuizEtudiantById(Long id) {
		return quizEtudiantDao.findQuizEtudiantById(id);
	}

	public QuizEtudiant save(QuizEtudiant quizEtudiant) {
		quizEtudiant.setRef(RandomStringUtils.randomAlphanumeric(3));
		Quiz quiz=quizService.findQuizById(quizEtudiant.getQuiz().getId());
        Etudiant etudiant = etudiantService.findEtudiantById(quizEtudiant.getEtudiant().getId());
        quizEtudiant.setQuiz(quiz);
        quizEtudiant.setEtudiant(etudiant);
       if(quiz==null){
          return null;
       }
       if(etudiant==null){
           return null;
        } else
		{
			return quizEtudiantDao.save(quizEtudiant);
		}
	}

	public List<QuizEtudiant> findAll() {
		return quizEtudiantDao.findAll();
	}

	public void update(QuizEtudiant quizEtudiant) {
		quizEtudiant.setNote(quizEtudiant.getNote());
		quizEtudiant.setResultat(quizEtudiant.getResultat());
		quizEtudiantDao.save(quizEtudiant);
		
	}

	public List<QuizEtudiant> findByEtudiantId(Long id) {
		return quizEtudiantDao.findByEtudiantId(id);
	}

	public Object findByCritere(String refEtudiant, String refQuiz)
	{
		String query = "SELECT q FROM QuizEtudiant q WHERE q.etudiant.ref= '"+refEtudiant+"' and q.quiz.ref='"+refQuiz+"'";
		return entityManager.createQuery(query).getSingleResult();
	}

	public QuizEtudiant quizByEtudiantIdAndQuizId(Long idEtudiant, Long idQuiz) {
		return quizEtudiantDao.findByEtudiantIdAndQuizId(idEtudiant, idQuiz);
	}
	public QuizEtudiant quizByEtudiantIdAndQuizRef(Long idEtudiant, String ref) {
		return quizEtudiantDao.findByEtudiantIdAndQuizRef(idEtudiant, ref);
	}
}
