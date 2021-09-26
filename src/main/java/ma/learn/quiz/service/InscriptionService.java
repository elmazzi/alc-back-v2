package ma.learn.quiz.service;

import java.security.SecureRandom;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.bean.EtatInscription;
import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.Inscription;
import ma.learn.quiz.bean.Parcours;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.dao.InscriptionDao;
import ma.learn.quiz.service.vo.EtudiantVo;





@Service
public class InscriptionService {
	@Autowired
	public InscriptionDao inscriptionDao;
	@Autowired
	public EtatInscriptionService etatInscriptionService;
	@Autowired
	public ParcoursService parcoursService;
	@Autowired
	public ProfService profService;
	@Autowired
	public CentreService centreService;
	@Autowired
	public EtudiantService etudiantService;
	@Autowired
	public EntityManager entityManager;


	public List<Inscription> findByCriteria (Inscription inscrit ){
		String query = "SELECT e FROM Inscription e WHERE 1=1";
		if (inscrit.getNom() != null  )
		{
			query += " AND  e.nom LIKE '%" + inscrit.getNom()+"%'";
		}
		if (inscrit.getPrenom() != null)
		{
			query+= "  AND  e.prenom LIKE '%" + inscrit.getPrenom()+"'";
		}

		if (inscrit.getLogin() != null)
		{
			query+= "  AND  e.login LIKE '%" + inscrit.getLogin()+"'";
		}

		return  entityManager.createQuery(query).getResultList();
	}

	public int save(Inscription  inscription ) {
		Inscription inscriptionLogin = findInscriptionByLogin(inscription.getLogin());
		List<Prof> profs=profService.findAll();
		List<Parcours> parcours=parcoursService.findAll();
		Prof prof = profs.get(1);
		Parcours parcrs = parcours.get(1);
		if (inscriptionLogin != null || inscription.getNumero().isEmpty() || inscription.getNom().isEmpty() || inscription.getPrenom().isEmpty() || inscription.getLogin().isEmpty() ) {
			return -1;
		}else {
			char[] possibleCharacters = (new String("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~&*-_")).toCharArray();
			String pass = RandomStringUtils.random( 10, 0, possibleCharacters.length-1, false, false, possibleCharacters, new SecureRandom() );
			EtatInscription etatInscription = etatInscriptionService.findEtatInscriptionById((long) 1);
			inscription.setProf(prof);
			inscription.setPassword(pass);
			inscription.setParcours(parcrs);
			inscription.setEtatInscription(etatInscription);
			inscriptionDao.save(inscription);
			return 1;
		}
	}


	public Inscription findInscriptionByLogin(String login) {
		return inscriptionDao.findInscriptionByLogin(login);
	}


	public int valider(Inscription inscription){
		System.out.println(inscription.getEtatInscription().getId());
		Inscription loadedInscription = findInscriptionById(inscription.getId());
		EtatInscription etatInscription=etatInscriptionService.findEtatInscriptionById(inscription.getEtatInscription().getId());
		loadedInscription.setEtatInscription(inscription.getEtatInscription());
		loadedInscription.setProf(inscription.getProf());
		if (etatInscription.getId() == 2) {
			Etudiant etudiant = new Etudiant();
			etudiant.setAddress(loadedInscription.getAddress());
			etudiant.setAge(loadedInscription.getAge());
			etudiant.setLogin(loadedInscription.getLogin());
			etudiant.setNom(loadedInscription.getNom());
			etudiant.setParcours(loadedInscription.getParcours());
			etudiant.setProf(inscription.getProf());
			etudiant.setPassword(loadedInscription.getPassword());
			etudiant.setPrenom(loadedInscription.getPrenom());
			etudiant.setRef(loadedInscription.getRef());
			etudiant.setVille(loadedInscription.getVille());
			etudiant.setGmail(loadedInscription.getGmail());
			etudiant.setNumero(loadedInscription.getNumero());
			System.out.println(etudiant.getNom());
			etudiantService.create(etudiant);
			return 1;
		}else {
			inscriptionDao.save(loadedInscription);
			return 2;
		}
	}





	public List<Inscription> findAll() {
		return inscriptionDao.findAll();
	}





	@Transactional
	public int deleteInscriptionById(List<Inscription> inscription) {
		int res=0;
		for (int i = 0; i < inscription.size(); i++) {
			res+=deleteInscriptionById(inscription.get(i).getId());
		}
		return res;
	}

	@Transactional
	public int deleteInscriptionById(Long id) {
		return inscriptionDao.deleteInscriptionById(id);
	}


	public Inscription findInscriptionById(Long id) {
		return inscriptionDao.findInscriptionById(id);
	}


	public int deleteByEtatInscriptionRef(String ref) {
		return inscriptionDao.deleteByEtatInscriptionRef(ref);
	}



	public int deleteByRef(String ref) {
		return inscriptionDao.deleteByRef(ref);
	}


	@Transactional
	public int deleteByNumeroInscription(int numeroInscription) {
		return inscriptionDao.deleteByNumeroInscription(numeroInscription);
	}





	public Inscription findByNumeroInscription(int numeroInscription) {
		return inscriptionDao.findByNumeroInscription(numeroInscription);
	}



}
