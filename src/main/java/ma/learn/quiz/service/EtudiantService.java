package ma.learn.quiz.service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import freemarker.template.TemplateException;
import io.swagger.models.auth.In;
import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.InscriptionDao;
import ma.learn.quiz.dao.*;
import ma.learn.quiz.service.facade.UserService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import ma.learn.quiz.service.vo.EtudiantVo;

import static ma.learn.quiz.filter.RoleConstant.ROLE_STUDENT;

@Service
public class EtudiantService extends AbstractService {
    @Autowired
    private GroupeEtudeService groupeEtudeService;
    @Autowired
    private PackStudentService packStudentService;
    @Autowired
    public SessionCoursService sessionCoursService;
    @Autowired
    public InscriptionDao inscriptionDao;
    @Autowired
    public EtatInscriptionService etatInscriptionService;
    @Autowired
    public NiveauEtudeDao niveauEtudeDao;
    @Autowired
    public InteretEtudiantDao interetEtudiantDao;
    @Autowired
    public FonctionDao fonctionDao;
    @Autowired
    public StatutSocialDao statutSocialDao;
    @Autowired
    public SkillDao skillDao;
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
    @Autowired
    private InscriptionService inscriptionService;
    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private GroupeEtudiantService groupeEtudiantService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserServiceImpl userServiceImpl;
    @Autowired
    private UserDao userDao;
    @Autowired
    private ConfirmationTokenService confirmationTokenService;


    public List<Etudiant> findByParcoursCode(String code) {
        return etudiantDao.findByParcoursCode(code);
    }

    public Etudiant findByLogin(String login) {
        return etudiantDao.findByUsername(login);
    }

    public Etudiant update(Etudiant etudiant) {
        Etudiant loadedEtudiant = findEtudiantById(etudiant.getId());
        Parcours parcours = parcoursService.findParcoursById(etudiant.getParcours().getId());
        loadedEtudiant.setParcours(parcours);
        loadedEtudiant.setNom(etudiant.getNom());
        loadedEtudiant.setPrenom(etudiant.getPrenom());
        loadedEtudiant.setUsername(etudiant.getUsername());
        loadedEtudiant.setInteretEtudiant(etudiant.getInteretEtudiant());
        loadedEtudiant.setNiveauEtude(etudiant.getNiveauEtude());
        loadedEtudiant.setFonction(etudiant.getFonction());
        loadedEtudiant.setStatutSocial(etudiant.getStatutSocial());
        loadedEtudiant.setSkill(etudiant.getSkill());
        System.out.println("Tfu");
        return etudiantDao.save(loadedEtudiant);
    }

    public Etudiant findEtudiantById(Long id) {
        return etudiantDao.findEtudiantById(id);
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

    public Etudiant findById(Long id) throws Exception {
        Optional<Etudiant> etudiant = etudiantDao.findById(id);
        if (!etudiant.isPresent()) {
            throw new Exception("User not found");
        }
        return etudiant.get();
    }


    public User create(Long pack, Etudiant etudiant) throws MessagingException, IOException, TemplateException {
        Etudiant etudiant1 = this.findByLogin(etudiant.getUsername());
        PackStudent packStudent = packStudentService.findById(pack);
        Parcours parcours = parcoursService.findParcoursById(etudiant.getParcours().getId());
        User user;
        EtatInscription etatInscription = etatInscriptionService.findEtatInscriptionById((long) 1);
        if (etudiant1 != null) {
            Inscription inscription = createPack(etudiant1, packStudent, parcours, etatInscription, etudiant1);
            inscriptionService.save(inscription);
            return etudiant1;
        } else {
            etudiant.setParcours(parcours);
            String password = this.userService.generatePassword();
            etudiant.setPassword(password);
            etudiant.setAuthorities(Arrays.asList(new Role(ROLE_STUDENT)));
            etudiant.setRole(ROLE_STUDENT);
            etudiant.setNiveauEtude(niveauEtudeDao.findByCode(""));
            etudiant.setInteretEtudiant(interetEtudiantDao.findByCode(""));
            etudiant.setFonction(fonctionDao.findByCode(""));
            etudiant.setStatutSocial(statutSocialDao.findByCode(""));
            etudiant.setSkill(skillDao.findByCode(""));
            user = userService.saveWithPack(etudiant);
            Etudiant etudiant2 = new Etudiant(user);
            Inscription inscription = createPack(etudiant, packStudent, parcours, etatInscription, etudiant2);
            inscriptionService.save(inscription);
            return user;
        }
    }

    private Inscription createPack(Etudiant etudiant, PackStudent packStudent, Parcours parcours, EtatInscription etatInscription, Etudiant etudiant2) {
        Inscription inscription = new Inscription();
        inscription.setEtudiant(etudiant2);
        inscription.setEtatInscription(etatInscription);
        inscription.setGroupeEtude(etudiant.getGroupeEtude());
        inscription.setGroupeEtude(etudiant.getGroupeEtude());
        if (parcours != null) {
            inscription.setParcours(etudiant.getParcours());
        }
        if (packStudent != null) {
            inscription.setPackStudent(packStudent);
            inscription.setParcours(packStudent.getLevel());
            inscription.setQuizFinished(true);
            packStudent.setTotalStudents(packStudent.getTotalStudents() + 1);
            packStudentService.update(packStudent);
        }
        return inscription;
    }

    public User create(Etudiant etudiant) throws MessagingException, IOException, TemplateException {
        Etudiant etudiant1 = this.findByLogin(etudiant.getUsername());
        if (etudiant1 != null) {
            return null;
        } else {
            Inscription inscription = new Inscription();
            EtatEtudiantSchedule etudiantSchedule = this.etatEtudiantScheduleService.findByRef(etudiant.getEtatEtudiantSchedule().getRef());
            Parcours parcours = parcoursService.findParcoursById(etudiant.getParcours().getId());
            GroupeEtude groupeEtude = groupeEtudeService.findGroupeEtudeById(etudiant.getGroupeEtude().getId());

            EtatInscription etatInscription = etatInscriptionService.findEtatInscriptionById((long) 1);
            etudiant.setParcours(parcours);
            etudiant.setGroupeEtude(groupeEtude);
            inscription.setGroupeEtude(etudiant.getGroupeEtude());
            if (parcours != null) {
                inscription.setParcours(etudiant.getParcours());
            }
            etudiant.setEtatEtudiantSchedule(etudiantSchedule);
            String password = this.userService.generatePassword();
            etudiant.setPassword(password);
            etudiant.setAuthorities(Arrays.asList(new Role(ROLE_STUDENT)));
            etudiant.setRole(ROLE_STUDENT);
            inscription.setGroupeEtude(etudiant.getGroupeEtude());
            etudiant.setNiveauEtude(niveauEtudeDao.findByCode(""));
            etudiant.setInteretEtudiant(interetEtudiantDao.findByCode(""));
            etudiant.setFonction(fonctionDao.findByCode(""));
            etudiant.setStatutSocial(statutSocialDao.findByCode(""));
            etudiant.setSkill(skillDao.findByCode(""));
            etudiant.setEnabled(false);
            User user = userService.save(etudiant);
            System.out.println(user.getId());
            Etudiant etudiant2 = new Etudiant(user);
            inscription.setEtudiant(etudiant2);
            inscription.setEtatInscription(etatInscription);
            inscriptionService.save(inscription);
            return user;
        }

    }


    public int save(Etudiant etudiant) {
        Parcours parcours = parcoursService.findParcoursById(etudiant.getParcours().getId());

        Optional<EtatEtudiantSchedule> etat = etatEtudiantScheduleService.findById((long) 1);
        EtatEtudiantSchedule etatLoaded = etat.get();
        if (parcours == null) {
            return -3;
        } else {
            etudiant.setParcours(parcours);

            etudiant.setEtatEtudiantSchedule(etatLoaded);
            etudiantDao.save(etudiant);
            return 1;
        }
    }

    public Etudiant updateEtudiant(Etudiant etudiant) {
        Fonction fonction = fonctionDao.findByCode(etudiant.getFonction().getCode());
        NiveauEtude niveauEtude = niveauEtudeDao.findByCode(etudiant.getNiveauEtude().getCode());
        StatutSocial statutSocial = statutSocialDao.findByCode(etudiant.getStatutSocial().getCode());
        InteretEtudiant interetEtudiant = interetEtudiantDao.findByCode(etudiant.getInteretEtudiant().getCode());
        /*
        etudiant.setNiveauEtude(niveauEtude);
        etudiant.setFonction(fonction);
        etudiant.setInteretEtudiant(interetEtudiant);
        etudiant.setStatutSocial(statutSocial);
        return this.etudiantDao.save(etudiant);

         */
        etudiant.setNiveauEtude(etudiant.getNiveauEtude());
        etudiant.setFonction(etudiant.getFonction());
        etudiant.setInteretEtudiant(etudiant.getInteretEtudiant());
        etudiant.setStatutSocial(etudiant.getStatutSocial());
        etudiant.setSkill(etudiant.getSkill());
        return this.etudiantDao.save(etudiant);
    }

    public int updatePassword(String username, String newPassword) {
        User user = userServiceImpl.loadUserByUsername(username);
        user.setPassword(passwordEncoder.encode(newPassword));
        userDao.save(user);
        return 1;
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
        this.inscriptionService.deleteInscriptionByEtudiantId(id);
        List<GroupeEtudiantDetail> detailList = this.groupeEtudiantDetailService.findByEtudiantId(id);
        for (GroupeEtudiantDetail groupeDetail : detailList) {
            GroupeEtudiant groupeEtudiant = this.groupeEtudiantService.findGroupeEtudiantById(groupeDetail.getGroupeEtudiant().getId());
            groupeEtudiant.setNombrePlaceNonVide(groupeEtudiant.getNombrePlaceNonVide() - 1);
            groupeEtudiant.setNombrePlacevide(groupeEtudiant.getNombrePlacevide() + 1);
            this.groupeEtudiantService.update(groupeEtudiant);
        }
        this.groupeEtudiantDetailService.deleteGroupeEtudiantDetailByEtudiantId(id);
        this.dictionaryService.deleteDictionaryByEtudiantId(id);
        return etudiantDao.deleteEtudiantById(id);
    }

    public int deleteByParcoursId(Long id) {
        return etudiantDao.deleteByParcoursId(id);
    }

    public Object findByCritere(String login, String password) {
        String query = "SELECT a FROM Etudiant a WHERE a.username= '" + login + "' and a.password='" + password + "'";
        return entityManager.createQuery(query).getSingleResult();
    }

    public List<Etudiant> findEtudiantByGroupeEtudiantDetailsGroupeEtudiantParcours(String libelle) {
        return etudiantDao.findEtudiantByGroupeEtudiantDetailsGroupeEtudiantParcours(libelle);
    }

    public List<Etudiant> findByParcoursLibelle(String libelle) {
        return etudiantDao.findByParcoursLibelle(libelle);
    }

    public List<Etudiant> findByCriteria(Etudiant etudiant) {
        String query = this.init("Etudiant");
        if (etudiant != null) {
            if (etudiant.getNom() != null) {
                query += this.addCriteria("nom", etudiant.getNom(), "LIKE");
            }
            if (etudiant.getPrenom() != null) {
                query += this.addCriteria("prenom", etudiant.getPrenom(), "LIKE");
            }

        }
        System.out.println("query = " + query);
        System.out.println(entityManager.createQuery(query).getResultList().size());
        return entityManager.createQuery(query).getResultList();
    }


    public Etudiant validateToken(String token) throws Exception {
        ConfirmationToken confirmationToken = confirmationTokenService.getToken(token);
        LocalDateTime localDateTime = LocalDateTime.now();
        if (confirmationToken.getExpiresAt().isBefore(localDateTime)) {
            throw new Exception("token expired");
        } else {
            confirmationToken.setConfirmedAt(localDateTime);
            confirmationTokenService.save(confirmationToken);
            Etudiant userFromToken = confirmationToken.getUser();
            userFromToken.setEnabled(true);
            return etudiantDao.save(userFromToken);
        }
    }
}
