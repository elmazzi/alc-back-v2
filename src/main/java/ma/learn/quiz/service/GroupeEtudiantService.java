package ma.learn.quiz.service;


import ma.learn.quiz.bean.GroupeEtudiant;
import ma.learn.quiz.dao.GroupeEtudiantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;
@Service
public class GroupeEtudiantService {
    @Autowired
    private GroupeEtudiantDao GroupeEtudiantDao;

    public int save(GroupeEtudiant groupeEtudiant)
    {
        if(findByLibelle(groupeEtudiant.getLibelle())!=null)
        {
            return -1;
        }
        else
            GroupeEtudiantDao.save(groupeEtudiant);
        return 1;

    }
    public int update(GroupeEtudiant groupeEtudiant){
        GroupeEtudiantDao.save(groupeEtudiant);
        return 1;
    }

    public GroupeEtudiant findByLibelle(String libelle) {
        return GroupeEtudiantDao.findByLibelle(libelle);
    }
    @Transactional
    public int deleteByLibelle(String libelle) {
        return GroupeEtudiantDao.deleteByLibelle(libelle);
    }

    public Optional<GroupeEtudiant> findById(Long id) {
        return GroupeEtudiantDao.findById(id);
    }

    public List<GroupeEtudiant> findAll() {
        return GroupeEtudiantDao.findAll();
    }

}
