package ma.learn.quiz.service;

import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.bean.Paiement;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.SessionCours;
import ma.learn.quiz.dao.ProfDao;
import ma.learn.quiz.vo.SalaryVo;

@Service
public class ProfService {


	public List<Prof> findByCriteria (Prof prof ){
		String query = "SELECT e FROM Prof e WHERE 1=1";
		if (prof.getNom() != null  )
		{
			query += " AND  e.nom LIKE '%" + prof.getNom()+"%'";
		}
		if (prof.getPrenom() != null)
		{
			query+= "  AND  e.prenom LIKE '%" + prof.getPrenom()+"'";
		}

		if (prof.getLogin() != null)
		{
			query+= "  AND  e.login LIKE '%" + prof.getLogin()+"'";
		}

		return  entityManager.createQuery(query).getResultList();
	}

	public Prof findByNumero(String ref) {
		return profDao.findByNumero(ref);
	}

	public int deleteByNumero(String ref) {
		return profDao.deleteByNumero(ref);
	}

	public Prof findByLogin(String login) {
		return profDao.findByLogin(login);
	}

	public Prof findProfById(Long id) {
		return profDao.findProfById(id);
	}

	public List<Prof> findAll() {
		return profDao.findAll();
	}
	public Prof update(Prof prof ) {
		Prof profLoaded = findProfById(prof.getId());
		profLoaded.setNom(prof.getNom());
		profLoaded.setPrenom(prof.getPrenom());
		profLoaded.setAddresse(prof.getAddresse());
		profLoaded.setLogin(prof.getLogin());
		profLoaded.setPassword(prof.getPassword());
		profLoaded.setEmail(prof.getEmail());
		return profDao.save(profLoaded);
	}
	public int save(Prof prof ) {
		if(findProfById(prof.getId())!=null) {
			return -1;
		}
		if(findByLogin(prof.getLogin())!=null) {
			return -2;
		}
		else {
			char[] possibleCharacters = (new String("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~&*-_")).toCharArray();
			String pass = RandomStringUtils.random( 10, 0, possibleCharacters.length-1, false, false, possibleCharacters, new SecureRandom() );
			System.out.println("id::: " + prof.getId());
			prof.setPassword(pass);
			profDao.save(prof);
			return 1;
		}

	}
	public List<SessionCours> calcStatistique(SalaryVo salaryVo) {
    	/*String query = "SELECT NEW ma.learn.quiz.vo.SalaryVo(COUNT(s.id)) FROM SessionCours s WHERE s.mois = ? and s.annee=?";
    	System.out.println("query = " + query);
    	int res = entityManager.createQuery(query).getResultList();
    	System.out.println("res = " + res);
    	return res; */
		String query = "SELECT Count(s.id) From SessionCours s where s.dateDebut = '"+ salaryVo.getAnnee()+"/"+ salaryVo.getMois()+"/01'";
		return entityManager.createQuery(query).getResultList();
	}

	public Prof findByRef(String ref) {
		return profDao.findByRef(ref);
	}

	public int deleteByRef(String ref) {
		return profDao.deleteByRef(ref);
	}
	@Transactional
	public int deleteProfById(List<Prof> prof) {
		int res=0;
		for (int i = 0; i < prof.size(); i++) {
			res+=deleteProfById(prof.get(i).getId());
		}
		return res;
	}
	@Transactional
	public int deleteProfById(Long id) {
		return profDao.deleteProfById(id);
	}

	public List<Prof> findByNom(String nom) {
		return profDao.findByNom(nom);
	}

	public Object findByCritere(String login, String password)
	{
		String query = "SELECT p FROM Prof p WHERE p.login= '"+login+"' and p.password='"+password+"'";
		return entityManager.createQuery(query).getSingleResult();
	}

	public List<Paiement> paiementProfs() {
		List<Paiement> ps = new ArrayList<>();
		List<Prof> profs = this.findAll();
		for (i = 0; i < profs.size(); i++) {//<1profs.size()
			Paiement p = new Paiement();
			p.setProf(profs.get(i));
			List<SessionCours> sessionCours = sessionCoursService.findByProfId(profs.get(i).getId());//2
			BigDecimal total = BigDecimal.ZERO;
			int nonPaye = 0;
			for (j = 0; j < sessionCours.size(); j++) {//<2
				if (sessionCours.get(i).getPayer() == "false") {
					total = total.add(sessionCours.get(i).getDuree());
					nonPaye++;

				}
			}
			p.setNonPaye(nonPaye);
			p.setTotalHeure(total);
			p.setMontant(p.getTotalHeure().multiply((profs.get(i).getCategorieProf().getLessonRate())));
			ps.add(p);
		}
		return ps;
	}

	public List<SessionCours> findSessionsNonPayer(Long idProf)
	{
		String query = "SELECT s From SessionCours s where s.payer = 'false' and s.prof.id = '"+idProf+"'";
		return entityManager.createQuery(query).getResultList();
	}

	@Autowired
	public EntityManager entityManager;
	@Autowired
	private ProfDao profDao;
	@Autowired
	private SessionCoursService sessionCoursService;
	private int i;
	private int j;
}