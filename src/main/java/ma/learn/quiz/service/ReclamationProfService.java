package ma.learn.quiz.service;

import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.ReclamationProf;
import ma.learn.quiz.bean.TypeReclamationProf;
import ma.learn.quiz.dao.ReclamationProfDao;
import ma.learn.quiz.service.Util.UtilString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class ReclamationProfService {
    @Autowired
    private ReclamationProfDao reclamationProfDao;
    @Autowired
    private ProfService profService;
    @Autowired
    private TypeReclamationProfService typeReclamationProfService;

    public List<ReclamationProf> findAll() {
        return reclamationProfDao.findAll();
    }

    public int saveReclamationProf(ReclamationProf reclamationProf) {
        Prof prof = profService.findProfById(reclamationProf.getProf().getId());
        TypeReclamationProf typeReclamationProf1 = typeReclamationProfService.findTypeReclamationProfByCode(reclamationProf.getTypeReclamationProf().getCode());
        if (prof == null || typeReclamationProf1 == null) {
            return -1;
        } else {
            ReclamationProf reclamationProf1 = new ReclamationProf();
            reclamationProf1.setDateReclamation(new Date());
            reclamationProf1.setProf(prof);
            reclamationProf1.setTypeReclamationProf(typeReclamationProf1);
            reclamationProf1.setTraite(false);
            reclamationProf1.setMessage(reclamationProf.getMessage());
            reclamationProf1.setCommentaireTraiteur(null);
            reclamationProf1.setReference(UtilString.generateStringUppercaseAndLowercase(6));
            reclamationProfDao.save(reclamationProf1);
            return 1;
        }
    }

    public int reponseReclamationProf(Long idreclamationProf,String commentaireTraiteur) {
        ReclamationProf reclamationProf = reclamationProfDao.findReclamationProfById(idreclamationProf);
        if (reclamationProf == null) {
            return -1;
        } else {
            reclamationProf.setTraite(true);
            reclamationProf.setDateTraitement(new Date());
            reclamationProf.setCommentaireTraiteur(commentaireTraiteur);
            reclamationProfDao.save(reclamationProf);
            return 1;
        }
    }
}
