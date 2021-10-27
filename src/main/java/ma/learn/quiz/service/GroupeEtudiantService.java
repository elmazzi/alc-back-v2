package ma.learn.quiz.service;


import ma.learn.quiz.bean.GroupeEtude;
import ma.learn.quiz.bean.GroupeEtudiant;
import ma.learn.quiz.bean.GroupeEtudiantDetail;
import ma.learn.quiz.bean.Parcours;
import ma.learn.quiz.dao.GroupeEtudiantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;
@Service
public class GroupeEtudiantService {
    @Autowired
    private GroupeEtudiantDao groupeEtudiantDao;
    @Autowired
    private GroupeEtudeService groupeEtudeService;
    @Autowired
    private ParcoursService parcoursService;
    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;

    public int save(GroupeEtudiant groupeEtudiant)

    {

     //   Parcours parcours = parcoursService.findParcoursByLibelle(groupeEtudiant.getParcours().getLibelle());
        if(findByLibelle(groupeEtudiant.getLibelle())!=null)
        {
            return -1;
        }
        else {
            GroupeEtude groupeEtude =  groupeEtudeService.findGroupeEtudeById(groupeEtudiant.getGroupeEtude().getId());
            groupeEtudiant.setGroupeEtude(groupeEtude);
           // groupeEtudiant.setParcours(parcours);
            groupeEtudiantDao.save(groupeEtudiant);
                groupeEtudiantDetailService.save(groupeEtudiant, groupeEtudiant.getGroupeEtudeDetails());

            return 1;
        }

    }
    public int update(GroupeEtudiant groupeEtudiant){
        groupeEtudiantDao.save(groupeEtudiant);
        return 1;
    }

    public GroupeEtudiant findByLibelle(String libelle) {
        return groupeEtudiantDao.findByLibelle(libelle);
    }

    @Transactional
    public int deleteGroupeEtudiantById(Long id) {
        int x = groupeEtudiantDetailService.deleteByGroupeEtudiantId(id);
        int y = groupeEtudiantDao.deleteGroupeEtudiantById(id);
        return x+y;
    }



    public List<GroupeEtudiant> findAll() {
        return groupeEtudiantDao.findAll();
    }


}
