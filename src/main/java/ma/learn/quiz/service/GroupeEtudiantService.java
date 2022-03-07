package ma.learn.quiz.service;


import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.GroupeEtudiantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class GroupeEtudiantService extends AbstractService  {
    @Autowired
    private GroupeEtudiantDao groupeEtudiantDao;
    @Autowired
    private GroupeEtudeService groupeEtudeService;
    @Autowired
    private ParcoursService parcoursService;
    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;
    @Autowired
    public EntityManager entityManager;
    @Autowired
    public ProfService profService ;

    public GroupeEtudiant findGroupeEtudiantByLibelleAndProfId(String libelle, Long idprof) {
        return groupeEtudiantDao.findGroupeEtudiantByLibelleAndProfId(libelle, idprof);
    }

    public List<GroupeEtudiant> findGroupeEtudiantByProfId(Long id) {
        return groupeEtudiantDao.findGroupeEtudiantByProfId(id);
    }

    public int save(GroupeEtudiant groupeEtudiant) {

        Parcours parcours = parcoursService.findParcoursByLibelle(groupeEtudiant.getParcours().getLibelle());
        GroupeEtude groupeEtude = groupeEtudeService.findGroupeEtudeById(groupeEtudiant.getGroupeEtude().getId());
       // Prof prof = profService.findProfById(groupeEtudiant.getProf().getId());
            groupeEtudiant.setGroupeEtude(groupeEtude);
          //  groupeEtudiant.setProf(prof);
            groupeEtudiant.setParcours(parcours);
            groupeEtudiant.setProf(groupeEtudiant.getProf());
            groupeEtudiantDao.save(groupeEtudiant);
            groupeEtudiantDetailService.save(groupeEtudiant, groupeEtudiant.getGroupeEtudeDetails());

      return 1;

    }

    public GroupeEtudiant findGroupeEtudiantById(Long id) {
        return groupeEtudiantDao.findGroupeEtudiantById(id);
    }

    public int update(GroupeEtudiant groupeEtudiant) {
        groupeEtudiantDao.save(groupeEtudiant);
        groupeEtudiantDetailService.save(groupeEtudiant, groupeEtudiant.getGroupeEtudeDetails());
        return 1;
    }

    public GroupeEtudiant findByLibelle(String libelle) {
        return groupeEtudiantDao.findByLibelle(libelle);
    }

    @Transactional
    public int deleteGroupeEtudiantById(Long id) {
        int x = groupeEtudiantDetailService.deleteByGroupeEtudiantId(id);
        int y = groupeEtudiantDao.deleteGroupeEtudiantById(id);
        return x + y;
    }

    @Transactional
    public int deleteGroupeEtudiantById(List<GroupeEtudiant> groupeEtudiant) {
        int res1 = 0;
        int res2 = 0;

        for (int i = 0; i < groupeEtudiant.size(); i++) {
            res1 += deleteGroupeEtudiantById(groupeEtudiant.get(i).getId());
            res2 += groupeEtudiantDetailService.deleteByGroupeEtudiantId(groupeEtudiant.get(i).getId());
        }
        return res1 + res2;
    }
    /*
    @Transactional
    public int deleteGroupeEtudeById(List<GroupeEtude> groupeEtude) {
        int res = 0;
        for (int i = 0; i < groupeEtude.size(); i++) {
            res += deleteGroupeEtudeById(groupeEtude.get(i).getId());
        }
        return res;
    }


 */


    public List<GroupeEtudiant> findAll() {
        return groupeEtudiantDao.findAll();
    }


    public List<GroupeEtudiant> findByParcoursIdAndNombrePlacevideGreaterThan(Long id, Long nombrePlacevide) {
        return groupeEtudiantDao.findByParcoursIdAndNombrePlacevideGreaterThan(id, nombrePlacevide);
    }


    public List<GroupeEtudiant> findByCriteria(GroupeEtudiant groupeEtudiant) {
        String query = this.init("GroupeEtudiant");
        if (groupeEtudiant.getParcours() != null) {
            if(groupeEtudiant.getParcours().getLibelle() != null){
                query += this.addCriteria("parcours.libelle", groupeEtudiant.getParcours().getLibelle(), "LIKE");
            }
            if(groupeEtudiant.getLibelle() != null){
                query += this.addCriteria("libelle", groupeEtudiant.getLibelle(), "LIKE");
            }
        }
        System.out.println("query = " + query);
        System.out.println(entityManager.createQuery(query).getResultList().size());
        return entityManager.createQuery(query).getResultList();
    }

}
