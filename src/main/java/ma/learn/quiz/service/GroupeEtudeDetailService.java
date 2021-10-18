package ma.learn.quiz.service;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.GroupeEtudeDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GroupeEtudeDetailService {
    @Autowired
    private GroupeEtudeDetailDao groupeEtudeDetailDao;
    @Autowired
    private GroupeEtudiantService groupeEtudiantService;
    @Autowired
    private GroupeEtudeService groupeEtudeService;
    @Autowired
    private InscriptionService inscriptionService;
/*
    public List<Etudiant> findEtudiantByGroupeEtudeDetail(GroupeEtudeDetail groupeEtudeDetail) {
        return groupeEtudeDetailDao.findEtudiantByGroupeEtudeDetail(groupeEtudeDetail);
    }


 */
    public void save(GroupeEtude groupeEtude, List<GroupeEtudeDetail> groupeEtudeDetails) {

        for (GroupeEtudeDetail groupeEtudeDetail : groupeEtudeDetails) {

           //  groupeEtudeDetail.setEtudiants( findEtudiantByGroupeEtudeDetail(groupeEtudeDetail));
            groupeEtudiantService.save(groupeEtudeDetail.getGroupeEtudiant());
            groupeEtudeDetail.setGroupeEtude(groupeEtude);
            groupeEtudeDetailDao.save(groupeEtudeDetail);
            }
        }



}
