package ma.learn.quiz.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import com.fasterxml.jackson.annotation.JsonFormat;
import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.EtudiantDao;
import ma.learn.quiz.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.dao.InscriptionDao;


@Service
public class InscriptionService extends AbstractService {
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
    @Autowired
    public GroupeEtudiantService groupeEtudiantService;
    @Autowired
    private GroupeEtudeService groupeEtudeService;
    @Autowired
    private FonctionsService fonctionsService;
    @Autowired
    private NiveauEtudeService niveauEtudeService;
    @Autowired
    private StatutSocialService statutSocialService;
    @Autowired
    private InteretEtudiantService interetEtudiantService;

    @JsonFormat(pattern = "dd-MM-yyyy")
    Date dateActuelle = new Date();
    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;
    @Autowired
    private PackStudentService packStudentService;
    @Autowired
    private EtudiantDao etudiantDao;

    @Autowired
    public NiveauEtudeDao niveauEtudeDao;
    @Autowired
    public InteretEtudiantDao interetEtudiantDao;
    @Autowired
    public FonctionDao fonctionDao;
    @Autowired
    public StatutSocialDao statutSocialDao;
    public List<Inscription> findAllByEtatInscriptionLibelle(String libelle) {
        return inscriptionDao.findAllByEtatInscriptionLibelle(libelle);
    }

    public List<Inscription> findByCriteria(Inscription inscription) {
        String query = this.init("Inscription");
        if (inscription.getEtudiant() != null) {
            if (inscription.getEtudiant().getNom() != null) {
                query += this.addCriteria("etudiant.nom", inscription.getEtudiant().getNom(), "LIKE");
            }
            if (inscription.getEtudiant().getPrenom() != null) {
                query += this.addCriteria("etudiant.prenom", inscription.getEtudiant().getPrenom(), "LIKE");
            }
            if (inscription.getEtudiant().getUsername() != null) {
                query += this.addCriteria("etudiant.username", inscription.getEtudiant().getUsername(), "LIKE");
            }
        }
        System.out.println("query = " + query);
        System.out.println(entityManager.createQuery(query).getResultList().size());
        return entityManager.createQuery(query).getResultList();
    }


    public int affecter(Parcours parcours, GroupeEtude groupeEtude, Etudiant etudiant) {
        System.out.println(parcours.getId());
        System.out.println(groupeEtude.getId());
        System.out.println(etudiant.getId());
        List<GroupeEtudiant> list = groupeEtudiantService.findByParcoursIdAndNombrePlacevideGreaterThan(parcours.getId(), 0L);
        System.out.println("hanaa f affecter !!!!!");
        if (list == null || list.isEmpty()) {

            System.out.println("rah lista vida");
            GroupeEtudiant groupeEtudiant = new GroupeEtudiant();
            groupeEtudiant.setGroupeEtude(groupeEtude);
            groupeEtudiant.setParcours(parcours);
            groupeEtudiant.setLibelle(dateActuelle.toString());
            groupeEtudiant.setGroupeEtudeDetails(new ArrayList<>());
            GroupeEtudiantDetail groupeEtudiantDetail = new GroupeEtudiantDetail();
            groupeEtudiantDetail.setEtudiant(etudiant);
            groupeEtudiant.getGroupeEtudeDetails().add(groupeEtudiantDetail);
            groupeEtudiant.setNombrePlace(groupeEtudiant.getGroupeEtude().getNombreEtudiant());
            groupeEtudiant.setNombrePlacevide(groupeEtudiant.getGroupeEtude().getNombreEtudiant() - 1);
            groupeEtudiant.setNombrePlaceNonVide(1L);
            groupeEtudiantService.save(groupeEtudiant);
            return 1;
        } else {
            System.out.println("rah lista 3amera");
            GroupeEtudiant groupeEtudiant = list.get(0);
            groupeEtudiant.setNombrePlacevide(groupeEtudiant.getNombrePlacevide() - 1);
            groupeEtudiant.setNombrePlaceNonVide(groupeEtudiant.getNombrePlaceNonVide() + 1);
            GroupeEtudiantDetail groupeEtudiantDetail = new GroupeEtudiantDetail();
            groupeEtudiantDetail.setEtudiant(etudiant);
            groupeEtudiantDetailService.save(groupeEtudiant, groupeEtudiantDetail);
            return 2;
        }
    }

    public int save(Inscription inscription) {
        if (inscription.getId() != null) {
            PackStudent packStudent = packStudentService.findPackStudentByCode(inscription.getPackStudent().getCode());
            EtatInscription etatInscription = etatInscriptionService.findEtatInscriptionById(inscription.getEtatInscription().getId());
            Etudiant etudiant = this.etudiantService.findEtudiantById(inscription.getEtudiant().getId());
            Parcours parcours = parcoursService.findParcoursById(inscription.getParcours().getId());
            GroupeEtude groupeEtude = groupeEtudeService.findGroupeEtudeById(inscription.getGroupeEtude().getId());
            Prof prof = this.profService.findProfById((inscription.getProf().getId()));
            inscription.setParcours(parcours);
            inscription.setProf(prof);
            inscription.setEtatInscription(etatInscription);
            inscription.setEtudiant(etudiant);
            inscription.setGroupeEtude(groupeEtude);
            inscription.setPackStudent(packStudent);
            inscriptionDao.save(inscription);
            etudiant.setGroupeEtude(groupeEtude);
            etudiant.setParcours(parcours);
            etudiantDao.save(etudiant);
            affecter(parcours, groupeEtude, etudiant);
            return 0;
        } else {
            // inscription.setGroupeEtude(groupeEtudeService.findById(4485L).get());
            // inscription.setParcours(parcoursService.findByCode("Elementary 1"));
            if (inscription.getProf() == null) {
                inscription.setProf(new Prof());
            }

            if (inscription.getParcours() == null) {
                inscription.setParcours(new Parcours());
            }
            if (inscription.getGroupeEtude() == null) {
                inscription.setGroupeEtude(new GroupeEtude());
            }
            if (inscription.getEtudiant() == null) {
                inscription.setEtudiant(new Etudiant());
            }

            EtatInscription etatInscription = etatInscriptionService.findEtatInscriptionById((long) 1);
            Etudiant etudiant = this.etudiantService.findEtudiantById(inscription.getEtudiant().getId());
            Parcours parcours = parcoursService.findParcoursById(inscription.getParcours().getId());
            GroupeEtude groupeEtude = groupeEtudeService.findGroupeEtudeById(inscription.getGroupeEtude().getId());

            if (etudiant == null) {
                System.out.println("etudiant is null");
                return -1;
            } else {
                System.out.println("Nv etudiant");
                inscription.setParcours(parcours);
                //inscription.setProf(prof);
                //   inscription.setParcours(parcrs);
                inscription.setEtatInscription(etatInscription);
                inscription.setEtudiant(etudiant);
                inscription.setGroupeEtude(groupeEtude);
                inscriptionDao.save(inscription);
                //affecter(parcours, groupeEtude, etudiant);
                return 1;
            }
        }
    }

    public int  updateByStudent(String packCode, Etudiant etudiant){
        Inscription inscription = inscriptionDao.findInscriptionByEtudiantId(etudiant.getId());
        Parcours parcours = parcoursService.findParcoursById(etudiant.getParcours().getId());
        GroupeEtude groupeEtude = groupeEtudeService.findGroupeEtudeById(etudiant.getGroupeEtude().getId());
        PackStudent packStudent = packStudentService.findPackStudentByCode(packCode);
        Etudiant etudiant1 = etudiantService.findEtudiantById(etudiant.getId());
        if (inscription != null){
            inscription.setParcours(parcours);
            inscription.setGroupeEtude(groupeEtude);
            inscription.getEtudiant().setTeacherLocality(etudiant.getTeacherLocality());
            inscription.setPackStudent(packStudent);
            inscriptionDao.save(inscription);
            etudiant1.setGroupeEtude(inscription.getGroupeEtude());
            etudiant1.setParcours(inscription.getParcours());
            etudiant1.setTeacherLocality(etudiant.getTeacherLocality());
            etudiantDao.save(etudiant1);
            affecter(parcours, groupeEtude, etudiant);
            return 1;
        }
        else {
            return -1;
        }
    }


    public Inscription findInscriptionByLogin(String login) {
        return inscriptionDao.findInscriptionByEtudiantUsername(login);
    }

    public int valider(Inscription inscription) {
        Prof prof = this.profService.findProfById(inscription.getProf().getId());
        Parcours parcrs = this.parcoursService.findParcoursById(inscription.getParcours().getId());
        EtatInscription etatInscription = etatInscriptionService.findEtatInscriptionById(inscription.getEtatInscription().getId());
        Etudiant etudiant = etudiantService.findEtudiantById(inscription.getEtudiant().getId());
        NiveauEtude niveauEtude = niveauEtudeDao.findByCode(inscription.getNiveauEtude().getCode());
        StatutSocial statutSocial = statutSocialDao.findByCode(inscription.getStatutSocial().getCode());
        InteretEtudiant interetEtudiant = interetEtudiantDao.findByCode(inscription.getInteretEtudiant().getCode());
        Fonction fonction = fonctionDao.findByCode(inscription.getFonction().getCode());
        etudiant.setParcours(parcrs);
        inscription.setStatutSocial(inscription.getStatutSocial());
        inscription.setFonction(inscription.getFonction());
        inscription.setInteretEtudiant(inscription.getInteretEtudiant());
        inscription.setNiveauEtude(inscription.getNiveauEtude());
      inscription.setEtatInscription(etatInscription);
      inscription.setSkill(inscription.getSkill());
        /*  inscription.setNiveauEtude(niveauEtude);
        inscription.setFonction(fonction);
        inscription.setInteretEtudiant(interetEtudiant);
        inscription.setStatutSocial(statutSocial);

         */
        inscription.setProf(prof);
        inscription.setParcours(parcrs);
        inscriptionDao.save(inscription);
        etudiant.setStatutSocial(inscription.getStatutSocial());
        etudiant.setNiveauEtude(inscription.getNiveauEtude());
        etudiant.setFonction(inscription.getFonction());
        etudiant.setInteretEtudiant(interetEtudiant);
        etudiant.setSkill(inscription.getSkill());
        etudiantService.updateEtudiant(etudiant);
        return 0;
    }


    public List<Inscription> findAll() {
        return inscriptionDao.findAll();
    }


    @Transactional
    public int deleteInscriptionById(List<Inscription> inscription) {
        int res = 0;
        for (int i = 0; i < inscription.size(); i++) {
            res += deleteInscriptionById(inscription.get(i).getId());
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
        return inscriptionDao.deleteByEtudiantRef(ref);
    }


    @Transactional
    public int deleteByNumeroInscription(int numeroInscription) {
        return inscriptionDao.deleteByNumeroInscription(numeroInscription);
    }


    public Inscription findByNumeroInscription(int numeroInscription) {
        return inscriptionDao.findByNumeroInscription(numeroInscription);
    }

    public int deleteInscriptionByEtudiantId(Long id) {
        return inscriptionDao.deleteInscriptionByEtudiantId(id);
    }

    public Inscription findInscriptionByEtudiantId(Long id) {
        return inscriptionDao.findInscriptionByEtudiantId(id);
    }

    public List<Inscription> findAllByOrderByIdDesc() {
        return inscriptionDao.findAllByOrderByIdDesc();
    }
}
