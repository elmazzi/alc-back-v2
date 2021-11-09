package ma.learn.quiz.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import ma.learn.quiz.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.dao.InscriptionDao;


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
    @Autowired
    public GroupeEtudiantService groupeEtudiantService;
    @Autowired
    private GroupeEtudeService groupeEtudeService;


    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;

    public List<Inscription> findByCriteria(Inscription inscrit) {
        String query = "SELECT e FROM Inscription e WHERE 1=1";
        if (inscrit.getEtudiant().getNom() != null) {
            query += " AND  e.etudiant.nom LIKE '%" + inscrit.getEtudiant().getNom() + "%'";
        }
        if (inscrit.getEtudiant().getPrenom() != null) {
            query += "  AND  e.etudiant.prenom LIKE '%" + inscrit.getEtudiant().getPrenom() + "'";
        }

        if (inscrit.getEtudiant().getUsername() != null) {
            query += "  AND  e.etudiant.username LIKE '%" + inscrit.getEtudiant().getUsername() + "'";
        }

        return entityManager.createQuery(query).getResultList();
    }
    public int affecter(Parcours parcours , GroupeEtude groupeEtude, Etudiant etudiant){
        List<GroupeEtudiant> list = groupeEtudiantService.findByParcoursLibelleAndNombrePlacevideGreaterThan(parcours.getLibelle(), 0L);
        System.out.println("hanaa f affecter !!!!!");
        if(list==null || list.isEmpty()){
            System.out.println("rah lista vida");
            GroupeEtudiant groupeEtudiant= new GroupeEtudiant();
            groupeEtudiant.setGroupeEtude(groupeEtude);
            groupeEtudiant.setParcours(parcours);
            groupeEtudiant.setGroupeEtudeDetails(new ArrayList<>());
            GroupeEtudiantDetail groupeEtudiantDetail = new GroupeEtudiantDetail();
            groupeEtudiantDetail.setEtudiant(etudiant);
            groupeEtudiant.getGroupeEtudeDetails().add(groupeEtudiantDetail);
            groupeEtudiantService.save(groupeEtudiant);
            return 1;
        }else{
            System.out.println("rah lista 3amera");
            GroupeEtudiant groupeEtudiant = list.get(0);
            groupeEtudiant.setNombrePlacevide(groupeEtudiant.getNombrePlacevide()-1);
            groupeEtudiant.setNombrePlaceNonVide(groupeEtudiant.getNombrePlaceNonVide()+1);
            GroupeEtudiantDetail groupeEtudiantDetail = new GroupeEtudiantDetail();
            groupeEtudiantDetail.setEtudiant(etudiant);
            groupeEtudiantDetailService.save(groupeEtudiant,groupeEtudiantDetail);
            return 2;
            }
    }
    public int save(Inscription inscription) {
        inscription.setGroupeEtude(groupeEtudeService.findById(4485L).get());
        inscription.setParcours(parcoursService.findByCode("Elementary 1"));
        if (inscription.getProf() == null) {
            inscription.setProf(new Prof());
        }
        if (inscription.getParcours() == null) {
            inscription.setParcours(new Parcours());
        }
        if (inscription.getEtudiant() == null) {
            inscription.setEtudiant(new Etudiant());
        }
        EtatInscription etatInscription = etatInscriptionService.findEtatInscriptionById((long) 1);
        Etudiant etudiant = this.etudiantService.findEtudiantById(inscription.getEtudiant().getId());
        GroupeEtude groupeEtude = groupeEtudeService.findGroupeEtudeById(inscription.getGroupeEtude().getId());
        Prof prof = this.profService.findProfById((inscription.getProf().getId()));
        Parcours parcrs = this.parcoursService.findParcoursById(inscription.getParcours().getId());
        if (etudiant == null) {
            System.out.println("etudiant is null");
            return -1;
        } else {
            System.out.println("Nv etudiant");
            inscription.setProf(prof);
            inscription.setParcours(parcrs);
            inscription.setEtatInscription(etatInscription);
            inscription.setEtudiant(etudiant);
            inscription.setGroupeEtude(groupeEtude);
            inscriptionDao.save(inscription);
            affecter(inscription.getParcours() , inscription.getGroupeEtude(), inscription.getEtudiant());
            return 1;
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


}
