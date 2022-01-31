package ma.learn.quiz.service;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.service.facade.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.dao.ProfDao;
import ma.learn.quiz.bean.Salary;

import static ma.learn.quiz.filter.RoleConstant.ROLE_PROF;

@Service
public class ProfService extends AbstractService{


    public List<Prof> findByCriteria(Prof prof) {
        String query = this.init("Prof");
        if (prof!= null) {
            if(prof.getNom() != null){
                query += this.addCriteria("nom", prof.getNom(), "LIKE");
            }
            if(prof.getPrenom() != null){
                query += this.addCriteria("prenom", prof.getPrenom(), "LIKE");
            }
            if(prof.getUsername() != null){
                query += this.addCriteria("username", prof.getUsername(), "LIKE");
            }
        }
        System.out.println("query = " + query);
        System.out.println(entityManager.createQuery(query).getResultList().size());
        return entityManager.createQuery(query).getResultList();
    }

    public EtudiantCours findProfByEtuID(Long id, Long idcours) {

        String query = "SELECT e FROM EtudiantCours e WHERE e.etudiant.id=" + id + "AND e.cours.id=" + idcours;

        return (EtudiantCours) entityManager.createQuery(query).getSingleResult();
    }

    public Prof findByNumero(String ref) {
        return profDao.findByNumero(ref);
    }

    public int deleteByNumero(String ref) {
        return profDao.deleteByNumero(ref);
    }

    public Prof findByLogin(String login) {
        return profDao.findByUsername(login);
    }

    public Prof findProfById(Long id) {
        return profDao.findProfById(id);
    }

    public List<Prof> findAll() {
        return profDao.findAll();
    }

    public Prof update(Prof prof) {
        Prof profLoaded = findProfById(prof.getId());
        profLoaded.setLevelMax(prof.getLevelMax());
        profLoaded.setLevelMin(prof.getLevelMin());
         trancheHoraireProfService.save(prof ,prof.getTrancheHoraireProfList());
        return profDao.save(profLoaded);
    }

    public int save(Prof prof) {
        if (findProfById(prof.getId()) != null) {
            return -1;
        }
        if (findByLogin(prof.getUsername()) != null) {
            return -2;
        } else {
            String password = this.userService.generatePassword();
            prof.setPassword(password);
            prof.setAuthorities(Arrays.asList(new Role(ROLE_PROF)));
            prof.setRole("TEACHER");
            userService.save(prof);
            return 1;
        }
    }

    public List<SessionCours> calcStatistique(Salary salaryVo) {
    	/*String query = "SELECT NEW ma.learn.quiz.bean.SalaryVo(COUNT(s.id)) FROM SessionCours s WHERE s.mois = ? and s.annee=?";
    	System.out.println("query = " + query);
    	int res = entityManager.createQuery(query).getResultList();
    	System.out.println("res = " + res);
    	return res; */
        String query = "SELECT Count(s.id) From SessionCours s where s.dateFin = '" + salaryVo.getAnnee() + "/" + salaryVo.getMois() + "/01'";
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
        int res = 0;
        for (int i = 0; i < prof.size(); i++) {
            res += deleteProfById(prof.get(i).getId());
        }
        return res;
    }

    @Transactional
    public int deleteProfById(Long id) {
        return profDao.deleteProfById(id);
    }

    public Prof findByNom(String nom) {
        return profDao.findByNom(nom);
    }

    public Object findByCritere(String login, String password) {
        String query = "SELECT p FROM Prof p WHERE p.username= '" + login + "' and p.password='" + password + "'";
        return entityManager.createQuery(query).getSingleResult();
    }

/*	public List<Paiement> paiementProfs() {
		List<Paiement> ps = new ArrayList<>();
		List<Prof> profs = this.findAll();
		for (i = 0; i < profs.size(); i++) {//<1profs.size()
			Paiement p = new Paiement();
			p.setProf(profs.get(i));
			List<SessionCours> sessionCours = sessionCoursService.findByProfId(profs.get(i).getId());//2
			BigDecimal total = BigDecimal.ZERO;
			int nonPaye = 0;
			for (j = 0; j < sessionCours.size(); j++) {//<2
				if (sessionCours.get(i).isPayer() == false) {
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
	}*/

    public List<SessionCours> findSessionsNonPayer(Long idProf) {
        String query = "SELECT s From SessionCours s where s.payer = 'false' and s.prof.id = '" + idProf + "'";
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
    @Autowired
    private UserService userService;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private TrancheHoraireProfService trancheHoraireProfService;
}