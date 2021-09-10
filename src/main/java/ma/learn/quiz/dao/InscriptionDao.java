package ma.learn.quiz.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import ma.learn.quiz.bean.Inscription;

public interface InscriptionDao extends JpaRepository<Inscription,Long>  {
	Inscription findByNumeroInscription(int numeroInscription);
	
	int deleteByNumeroInscription(int numeroInscription);
	int deleteByEtatInscriptionRef(String ref);
	int deleteByRef(String ref);
	int deleteInscriptionById(Long id);
	Inscription findInscriptionById(Long id);
	Inscription findInscriptionByLogin(String login);
	 Inscription findByEtatInscriptionRef(String ref);
}
