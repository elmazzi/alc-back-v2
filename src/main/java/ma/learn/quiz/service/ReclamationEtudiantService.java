package ma.learn.quiz.service;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.ReclamationEtudiantDao;
import ma.learn.quiz.dao.ReclamationProfDao;
import ma.learn.quiz.dao.TypeReclamationEtudiantDao;
import ma.learn.quiz.service.Util.UtilString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service

public class ReclamationEtudiantService {
    @Autowired
    private ReclamationEtudiantDao reclamationEtudiantDao;
    @Autowired
    private TypeReclamationEtudiantDao typeReclamationEtudiantDao;

    @Autowired
    private ProfService profService;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private TypeReclamationEtudiantService typeReclamationEtudiantService;

    public ReclamationEtudiant findReclamationEtudiantById(Long id) {
        return reclamationEtudiantDao.findReclamationEtudiantById(id);
    }

    public int saveReclamationEtudiant(ReclamationEtudiant reclamationEtudiant) {
        Etudiant etudiant = etudiantService.findEtudiantById(reclamationEtudiant.getEtudiant().getId());
        TypeReclamationEtudiant typeReclamationEtudiant = typeReclamationEtudiantService.findTypeReclamationEtudiantByCode(reclamationEtudiant.getTypeReclamationEtudiant().getCode());
        if (etudiant == null || typeReclamationEtudiant == null) {
            return -1;
        } else {
            ReclamationEtudiant reclamationEtudiant1 = new ReclamationEtudiant();
            reclamationEtudiant1.setDateReclamation(new Date());
            reclamationEtudiant1.setEtudiant(etudiant);
            reclamationEtudiant1.setTypeReclamationEtudiant(typeReclamationEtudiant);
            reclamationEtudiant1.setTraite(false);
            reclamationEtudiant1.setObjetReclamationEtudiant(reclamationEtudiant.getObjetReclamationEtudiant());
            reclamationEtudiant1.setMessage(reclamationEtudiant.getMessage());
            reclamationEtudiant1.setCommentaireTraiteur(null);
            reclamationEtudiant1.setReference(UtilString.generateStringUppercaseAndLowercase(6));
            reclamationEtudiantDao.save(reclamationEtudiant1);
            return 1;
        }
    }

    public int reponseReclamationEtudiant(Long idreclamationEtudiant,String commentaireTraiteur) {
        ReclamationEtudiant reclamationEtudiant = reclamationEtudiantDao.findReclamationEtudiantById(idreclamationEtudiant);
        if (reclamationEtudiant == null) {
            return -1;
        } else {
            reclamationEtudiant.setTraite(true);
            reclamationEtudiant.setDateTraitement(new Date());
            reclamationEtudiant.setCommentaireTraiteur(commentaireTraiteur);
            reclamationEtudiantDao.save(reclamationEtudiant);
            return 1;
        }
    }

    public List<ReclamationEtudiant> findAll() {
        return reclamationEtudiantDao.findAll();
    }
}
