package ma.learn.quiz.service;


import ma.learn.quiz.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.dao.ReponseDao;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class ReponseService {

    public List<Reponse> findByQuestionId(Long id) {
        return reponseDao.findByQuestionId(id);
    }

    @Transactional
    public int deleteByQuestionId(Long id) {
        return reponseDao.deleteByQuestionId(id);
    }

    @Transactional
    public void deleteById(Long id) {
        reponseDao.deleteById(id);
    }

    @Autowired
    private ReponseDao reponseDao;


	public Optional<Reponse> findById(Long id) {
		return reponseDao.findById(id);
	}


	public List<Reponse> findByEtatReponse(String etatReponse) {
		return reponseDao.findByEtatReponse(etatReponse);
	}

	@Autowired
    private EntityManager entityManager;
    
    public List<Reponse> findByQuestionNumero(Long numero) {
		return reponseDao.findByQuestionNumero(numero);
	}

	@Autowired
    private QuestionService questionService;

    public Reponse findByRef(String ref) {
        return reponseDao.findByRef(ref);
    }


    @Transactional
    public int deleteByRef(String ref) {
        return reponseDao.deleteByRef(ref);
    }


    public List<Reponse> findAll() {
        return reponseDao.findAll();
    }

    public int save(Reponse reponse) {
        if (findByRef(reponse.getRef()) != null) {
            return -1;
        }
       Question question = questionService.findByNumero(reponse.getQuestion().getNumero());
        // Question question = questionService.findByRef(reponse.getQuestion().getRef());
        reponse.setQuestion(question);
        if (question == null) {
            return -2;
        } else {
            questionService.update(question);
            reponseDao.save(reponse);
            return 1;

        }
    }

    public void saveAnswer(Reponse reponse) {
        reponseDao.save(reponse);
    }

    public List<Reponse> findByCriterial(Long id)
    {
    	String query= "Select r FROM Reponse r WHERE r.question.id='"+id+"' And r.etatReponse = 'true'";
    	return entityManager.createQuery(query).getResultList();
    }
    
    @Transactional
    public int deleteByQuestionRef(String ref) {
        return reponseDao.deleteByQuestionRef(ref);
    }


	public void save(Question question, List<Reponse> reponses) {
        for (Reponse reponse : reponses) {
            reponse.setQuestion(question);
            reponseDao.save(reponse);
        }
	}

    @Transactional
    public int deleteByQuestionQuizRef(String ref) {
        return reponseDao.deleteByQuestionQuizRef(ref);
    }

}
