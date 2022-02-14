package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.ReclamationEtudiant;
import ma.learn.quiz.bean.ReclamationProf;
import ma.learn.quiz.service.ReclamationEtudiantService;
import ma.learn.quiz.service.ReclamationProfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController

@RequestMapping("/admin/reclamationEtudiantAdmin")
public class ReclamationEtudiantAminRest {
    @Autowired
    private ReclamationEtudiantService reclamationEtudiantService;
    @GetMapping("/{idreclamationEtudiant}/{commentaireTraiteur}")

    public int reponseReclamationEtudiant(@PathVariable Long idreclamationEtudiant,@PathVariable String commentaireTraiteur) {
        return reclamationEtudiantService.reponseReclamationEtudiant(idreclamationEtudiant, commentaireTraiteur);
    }
    @GetMapping("/")

    public List<ReclamationEtudiant> findAll() {
        return reclamationEtudiantService.findAll();
    }
}
