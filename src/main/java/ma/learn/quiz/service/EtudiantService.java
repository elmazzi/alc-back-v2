package ma.learn.quiz.service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.service.facade.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.dao.EtudiantDao;
import ma.learn.quiz.dao.ScheduleProfDao;
import ma.learn.quiz.service.vo.EtudiantVo;

import static ma.learn.quiz.filter.RoleConstant.ROLE_STUDENT;

@Service
public class EtudiantService {

    public List<Etudiant> findByParcoursCode(String code) {
        return etudiantDao.findByParcoursCode(code);
    }

    public Etudiant findByLogin(String login) {
        return etudiantDao.findByUsername(login);
    }

    public Etudiant update(Etudiant etudiant) {
        Etudiant loadedEtudiant = findEtudiantById(etudiant.getId());
        Parcours parcours = parcoursService.findParcoursById(etudiant.getParcours().getId());
        Prof prof = profService.findProfById(etudiant.getProf().getId());
        loadedEtudiant.setParcours(parcours);
        loadedEtudiant.setProf(prof);
        loadedEtudiant.setNom(etudiant.getNom());
        loadedEtudiant.setPrenom(etudiant.getPrenom());
        loadedEtudiant.setUsername(etudiant.getUsername());
        return etudiantDao.save(loadedEtudiant);
    }

    public Etudiant findEtudiantById(Long id) {
        return etudiantDao.findEtudiantById(id);
    }

    public List<Etudiant> findEtudiantByProfId(Long id) {
        return etudiantDao.findEtudiantByProfId(id);
    }

    public Prof findProfById(Long id) {
        return profService.findProfById(id);
    }

    public int deleteByParcoursCode(String code) {
        return etudiantDao.deleteByParcoursCode(code);
    }

    public List<Etudiant> findByCriteria(EtudiantVo etudiantVo) {
        String query = "SELECT e FROM Etudiant e WHERE 1=1";
        if (etudiantVo.getNom() != null) {
            query += " AND  e.nom LIKE '%" + etudiantVo.getNom() + "%'";
        }
        if (etudiantVo.getPrenom() != null) {
            query += "  AND  e.prenom LIKE '%" + etudiantVo.getPrenom() + "'";
        }

        if (etudiantVo.getLogin() != null) {
            query += "  AND  e.login LIKE '%" + etudiantVo.getLogin() + "'";
        }

        return entityManager.createQuery(query).getResultList();
    }

    public Etudiant findByRef(String ref) {
        return etudiantDao.findByRef(ref);
    }

    public Etudiant findByNom(String nom) {
        return etudiantDao.findByNom(nom);
    }

    public void saveAll(ScheduleProf scheduleProf, Etudiant etudiant) {
        scheduleProf.setEtudiant(etudiant);
        EtatEtudiantSchedule etatEtudiantSchedule = etatEtudiantScheduleService.findByRef(scheduleProf.getEtudiant().getEtatEtudiantSchedule().getRef());
        etatEtudiantScheduleService.update(etatEtudiantSchedule);
        scheduleProfDao.save(scheduleProf);
    }

    public int create(Etudiant etudiant) {
        Etudiant etudiant1 = this.findByLogin(etudiant.getUsername());
        if (etudiant1 != null){
            return -2;
        }
        Inscription inscription = new Inscription();
        Etudiant etd = findByLogin(etudiant.getUsername());
        Prof prof = new Prof();
        prof = this.profService.findProfById(etudiant.getProf().getId());
        EtatEtudiantSchedule etudiantSchedule = this.etatEtudiantScheduleService.findByRef(etudiant.getEtatEtudiantSchedule().getRef());
        Parcours parcours = this.parcoursService.findParcoursById(etudiant.getParcours().getId());
        if (prof == null) {
            etudiant.setProf(null);
        } else {
            etudiant.setProf(prof);
        }

        if (parcours == null) {
            etudiant.setParcours(null);
        } else {
            etudiant.setParcours(parcours);
        }
        if (etudiantSchedule == null) {
            etudiant.setEtatEtudiantSchedule(null);
        } else {
            etudiant.setEtatEtudiantSchedule(etudiantSchedule);
        }
        if (etd != null) {
            return -1;
        } else {
			etudiant.setParcours(null);
			etudiant.setProf(null);
			etudiant.setEtatEtudiantSchedule(null);
            String password = this.userService.generatePassword();
            etudiant.setPassword(password);
            etudiant.setAuthorities(Arrays.asList(new Role(ROLE_STUDENT)));
            etudiant.setRole("STUDENT");
            inscription.setParcours(etudiant.getParcours());
            User user = userService.save(etudiant);
            System.out.println(user.getId());
            Etudiant etudiant2 = new Etudiant(user);
            inscription.setEtudiant(etudiant2);
            inscriptionService.save(inscription);
            return 1;
        }
    }


    public int save(Etudiant etudiant) {
        Parcours parcours = parcoursService.findParcoursById(etudiant.getParcours().getId());
        Prof prof = profService.findProfById(etudiant.getProf().getId());
        Optional<EtatEtudiantSchedule> etat = etatEtudiantScheduleService.findById((long) 1);
        EtatEtudiantSchedule etatLoaded = etat.get();
        if (parcours == null) {
            return -3;
        } else {
            etudiant.setParcours(parcours);
            etudiant.setProf(prof);
            etudiant.setEtatEtudiantSchedule(etatLoaded);
            etudiantDao.save(etudiant);
            return 1;
        }
    }

    public Etudiant updateEtudiant(Etudiant etudiant){
       return  this.etudiantDao.save(etudiant);
    }

    public List<Etudiant> findAll() {
        return etudiantDao.findAll();
    }

    @Transactional
    public int deleteEtudiantById(List<Etudiant> etudiant) {
        int res = 0;
        for (int i = 0; i < etudiant.size(); i++) {
            res += deleteEtudiantById(etudiant.get(i).getId());
        }
        return res;
    }

    @Transactional
    public int deleteEtudiantById(Long id) {
        return etudiantDao.deleteEtudiantById(id);
    }

    public int deleteByParcoursId(Long id) {
        return etudiantDao.deleteByParcoursId(id);
    }

    public Object findByCritere(String login, String password) {
        String query = "SELECT a FROM Etudiant a WHERE a.username= '" + login + "' and a.password='" + password + "'";
        return entityManager.createQuery(query).getSingleResult();
    }

    @Autowired
    public EtudiantDao etudiantDao;
    @Autowired
    public EtatEtudiantScheduleService etatEtudiantScheduleService;
    @Autowired
    public CentreService centreService;
    @Autowired
    public ParcoursService parcoursService;
    @Autowired
    public ProfService profService;
    @Autowired
    public ScheduleProfDao scheduleProfDao;
    @Autowired
    public EntityManager entityManager;
    @Autowired
    private UserService userService;
	public List<Etudiant> findByParcoursLibelle(String libelle) {
		return etudiantDao.findByParcoursLibelle(libelle);
	}
    @Autowired
    private InscriptionService inscriptionService;
}
