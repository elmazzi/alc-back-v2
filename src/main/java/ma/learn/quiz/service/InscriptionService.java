package ma.learn.quiz.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import com.fasterxml.jackson.annotation.JsonFormat;
import ma.learn.quiz.bean.*;
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
    @JsonFormat(pattern = "dd-MM-yyyy")
    Date dateActuelle = new Date();
    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;

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
            inscriptionDao.save(inscription);
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
            Prof prof = this.profService.findProfById((inscription.getProf().getId()));
            //   Parcours parcrs = this.parcoursService.findParcoursById(inscription.getParcours().getId());
            if (etudiant == null) {
                System.out.println("etudiant is null");
                return -1;
            } else {
                System.out.println("Nv etudiant");
                inscription.setParcours(parcours);
                inscription.setProf(prof);
                //   inscription.setParcours(parcrs);
                inscription.setEtatInscription(etatInscription);
                inscription.setEtudiant(etudiant);
                inscription.setGroupeEtude(groupeEtude);
                inscriptionDao.save(inscription);
                affecter(parcours, groupeEtude, etudiant);
                return 1;
            }
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
        etudiant.setParcours(parcrs);
        etudiant.setProf(prof);
        etudiantService.updateEtudiant(etudiant);
        inscription.setEtatInscription(etatInscription);
        inscription.setProf(prof);
        inscription.setParcours(parcrs);
        inscriptionDao.save(inscription);
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

    public List<Inscription> findInscriptionsByEtudiantId(Long id) {
        return inscriptionDao.findInscriptionsByEtudiantId(id);
    }

    public List<Inscription> findAllByOrderByIdDesc() {
        return inscriptionDao.findAllByOrderByIdDesc();
    }
}
