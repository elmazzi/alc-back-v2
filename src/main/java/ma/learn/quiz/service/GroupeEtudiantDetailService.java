package ma.learn.quiz.service;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.GroupeEtudiantDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class GroupeEtudiantDetailService {
    @Autowired
    private GroupeEtudiantDetailDao groupeEtudiantDetailDao;
    @Autowired
    private GroupeEtudiantService groupeEtudiantService;
    @Autowired
    private GroupeEtudeService groupeEtudeService;
    @Autowired
    private InscriptionService inscriptionService;
    @Autowired
    private EtudiantService etudiantService;

    /*
        public List<Etudiant> findEtudiantByGroupeEtudeDetail(GroupeEtudeDetail groupeEtudeDetail) {
            return groupeEtudeDetailDao.findEtudiantByGroupeEtudeDetail(groupeEtudeDetail);
        }
     */
    public void save(GroupeEtudiant groupeEtudiant, List<GroupeEtudiantDetail> groupeEtudiantDetails) {

        for (GroupeEtudiantDetail groupeEtudiantDetail : groupeEtudiantDetails) {
            Etudiant etudiant = etudiantService.findEtudiantById(groupeEtudiantDetail.getEtudiant().getId());
            //  groupeEtudeDetail.setEtudiants( findEtudiantByGroupeEtudeDetail(groupeEtudeDetail));
         //   groupeEtudiant.setNombrePlacevide(groupeEtudiant.getGroupeEtude().getNombreEtudiant()-1);
            groupeEtudiantDetail.setEtudiant(etudiant);
            groupeEtudiantDetail.setGroupeEtudiant(groupeEtudiant);
            groupeEtudiantDetailDao.save(groupeEtudiantDetail);

        }
    }
    public void save(GroupeEtudiant groupeEtudiant, GroupeEtudiantDetail groupeEtudiantDetail) {
        Etudiant etudiant = etudiantService.findEtudiantById(groupeEtudiantDetail.getEtudiant().getId());
        groupeEtudiantDetail.setEtudiant(etudiant);
        groupeEtudiantDetail.setGroupeEtudiant(groupeEtudiant);
        groupeEtudiantDetailDao.save(groupeEtudiantDetail);

    }

    public int deleteByGroupeEtudiantId(Long id) {
        return groupeEtudiantDetailDao.deleteByGroupeEtudiantId(id);
    }

    public void update(GroupeEtudiant groupeEtudiant, List<GroupeEtudiantDetail> groupeEtudiantDetails) {

        for (GroupeEtudiantDetail groupeEtudiantDetail : groupeEtudiantDetails) {
            Etudiant etudiant = etudiantService.findEtudiantById(groupeEtudiantDetail.getEtudiant().getId());

            //  groupeEtudeDetail.setEtudiants( findEtudiantByGroupeEtudeDetail(groupeEtudeDetail));
            groupeEtudiantDetail.setEtudiant(etudiant);
            groupeEtudiantDetail.setGroupeEtudiant(groupeEtudiant);
            groupeEtudiantDetailDao.save(groupeEtudiantDetail);
        }
    }

    public List<GroupeEtudiantDetail> findByGroupeEtudiantId(Long id) {
        return groupeEtudiantDetailDao.findByGroupeEtudiantId(id);
    }
/*
    public int update(GroupeEtude groupeEtude, List<GroupeEtudeDetail> groupeEtudeDetails) {
        for (GroupeEtudeDetail groupeEtudeDetail : groupeEtudeDetails) {

            //  groupeEtudeDetail.setEtudiants( findEtudiantByGroupeEtudeDetail(groupeEtudeDetail));
            groupeEtudiantService.save(groupeEtudeDetail.getGroupeEtudiant());
            groupeEtudeDetail.setGroupeEtude(groupeEtude);
            groupeEtudeDetailDao.save(groupeEtudeDetail);
        }
        return 1;
    }

     */

    public List<GroupeEtudiantDetail> findByEtudiantId(Long id) {
        return groupeEtudiantDetailDao.findByEtudiantId(id);
    }

    @Transactional
    public int deleteGroupeEtudiantDetailById(Long id) {
        return groupeEtudiantDetailDao.deleteGroupeEtudiantDetailById(id);
    }
}
