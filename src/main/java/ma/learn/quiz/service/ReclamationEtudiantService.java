package ma.learn.quiz.service;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.ReclamationEtudiantDao;
import ma.learn.quiz.dao.ReclamationProfDao;
import ma.learn.quiz.dao.TypeReclamationEtudiantDao;
import ma.learn.quiz.service.Util.UtilString;
import ma.learn.quiz.service.vo.ReclamationEtudiantVo;
import ma.learn.quiz.service.vo.SessionCoursVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.Date;
import java.util.List;

@Service

public class ReclamationEtudiantService extends AbstractService{
    @Autowired
    private ReclamationEtudiantDao reclamationEtudiantDao;
    @Autowired
    private TypeReclamationEtudiantDao typeReclamationEtudiantDao;
    @Autowired
    private AdminService adminService;

    @Autowired
    private ProfService profService;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private TypeReclamationEtudiantService typeReclamationEtudiantService;
    @Autowired
    public EntityManager entityManager;
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

            reclamationEtudiant1.setReference(UtilString.generateStringNumber(6));
            reclamationEtudiantDao.save(reclamationEtudiant1);
            return 1;
        }
    }

    public int reponseReclamationEtudiant(ReclamationEtudiant reclamationEtudiant1,Date dateTraitementforEtudiant) {
        ReclamationEtudiant reclamationEtudiant = reclamationEtudiantDao.findReclamationEtudiantById(reclamationEtudiant1.getId());
         if (reclamationEtudiant == null  ) {
            return -1;
        } else {
            reclamationEtudiant.setTraite(reclamationEtudiant1.getTraite());
            reclamationEtudiant.setDateTraitement(dateTraitementforEtudiant);
            reclamationEtudiant.setCommentaireTraiteur(reclamationEtudiant1.getCommentaireTraiteur());
            reclamationEtudiant.setAdmin(reclamationEtudiant1.getAdmin());
            reclamationEtudiantDao.save(reclamationEtudiant);

            return 1;
        }
    }

    public List<ReclamationEtudiant> findReclamationEtudiantByEtudiantId(Long id) {
        return reclamationEtudiantDao.findReclamationEtudiantByEtudiantId(id);
    }

    public List<ReclamationEtudiant> findAll() {
        return reclamationEtudiantDao.findAll();
    }

    public ReclamationEtudiant findReclamationEtudiantByIdAndEtudiantId(Long id, Long idetudiant) {
        return reclamationEtudiantDao.findReclamationEtudiantByIdAndEtudiantId(id, idetudiant);
    }
    public List<ReclamationEtudiant> findAllByCriteria(ReclamationEtudiantVo reclamationEtudiantVo) {
        String query = this.init("ReclamationEtudiant");
        if (reclamationEtudiantVo.getEtudiant() != null) {
            query += this.addCriteria("etudiant.nom", reclamationEtudiantVo.getEtudiant().getNom(), "LIKE");
        }
        if (reclamationEtudiantVo.getReference() != null) {
            query += this.addCriteria("reference", reclamationEtudiantVo.getReference(), "LIKE");
        }
        if (reclamationEtudiantVo.getTraite() != null) {
            query += this.addCriteria("traite", reclamationEtudiantVo.getTraite());
        }

        System.out.println("query = " + query);
        return entityManager.createQuery(query).getResultList();
    }

}
