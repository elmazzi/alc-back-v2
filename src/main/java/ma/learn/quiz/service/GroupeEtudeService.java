package ma.learn.quiz.service;

import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.GroupeEtude;
import ma.learn.quiz.bean.SessionCours;
import ma.learn.quiz.dao.GroupeEtudeDao;
import ma.learn.quiz.service.Util.UtilString;
import ma.learn.quiz.service.vo.GroupeEtudeVo;
import ma.learn.quiz.service.vo.SessionCoursVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class GroupeEtudeService {
    @Autowired
    private GroupeEtudeDao groupeEtudeDao;
    @Autowired
    public EntityManager entityManager;
    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;
    public int save(GroupeEtude groupeEtude)
    {
        if(findByLibelle(groupeEtude.getLibelle())!=null)
        {
            return -1;
        }
        else
            groupeEtudeDao.save(groupeEtude);
      /*     groupeEtudeDetailService.save(groupeEtude, groupeEtude.getGroupeEtudeDetails());

       */
        return 1;
    }

    public int update(GroupeEtude groupeEtude){
        groupeEtudeDao.save(groupeEtude);
   /*     groupeEtudeDetailService.save(groupeEtude, groupeEtude.getGroupeEtudeDetails());

    */
        return 1;
    }
    @Transactional
    public int deleteGroupeEtudeById(Long id) {
        return groupeEtudeDao.deleteGroupeEtudeById(id);
    }


    @Transactional
    public int deleteGroupeEtudeById(List<GroupeEtude> groupeEtude) {
        int res = 0;
        for (int i = 0; i < groupeEtude.size(); i++) {
            res += deleteGroupeEtudeById(groupeEtude.get(i).getId());
        }
        return res;
    }

    public List<GroupeEtude> findAllByCriteria(GroupeEtudeVo groupeEtudeVo) {
        String query = "SELECT c FROM GroupeEtude c WHERE 1=1 ";

        if ( UtilString.isnotEmpty(groupeEtudeVo.getLibelle()))

            query += " AND c.libelle LIKE '%" + groupeEtudeVo.getLibelle() + "%'";

        if (UtilString.isnotEmpty(groupeEtudeVo.getNombreEtudiant()))

            query += " AND c.nombreEtudiant LIKE '%" + groupeEtudeVo.getNombreEtudiant() + "%'";

        return entityManager.createQuery(query).getResultList();
    }
    @Transactional
    public int deleteByLibelle(String libelle) {
        return groupeEtudeDao.deleteByLibelle(libelle);
    }

    public Optional<GroupeEtude> findById(Long id) {
        return groupeEtudeDao.findById(id);
    }

    public List<GroupeEtude> findAll() {
        return groupeEtudeDao.findAll();
    }

    public GroupeEtude findByLibelle(String libelle) {
        return groupeEtudeDao.findByLibelle(libelle);
    }

    public GroupeEtude findGroupeEtudeById(Long id) {
        return groupeEtudeDao.findGroupeEtudeById(id);
    }
}
