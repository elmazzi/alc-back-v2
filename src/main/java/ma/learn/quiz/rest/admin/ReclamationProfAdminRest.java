package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.ReclamationEtudiant;
import ma.learn.quiz.bean.ReclamationProf;
import ma.learn.quiz.service.ReclamationProfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController

@RequestMapping("/admin/reclamationProfAdmin")
public class ReclamationProfAdminRest {

    @Autowired
    private ReclamationProfService reclamationProfService;

    @GetMapping("/")

    public List<ReclamationProf> findAll() {
        return reclamationProfService.findAll();
    }


    @GetMapping("/{idreclamationProf}/{commentaireTraiteur}")
    public int reponseReclamationProf(@PathVariable Long idreclamationProf, @PathVariable String commentaireTraiteur) {
        return reclamationProfService.reponseReclamationProf(idreclamationProf, commentaireTraiteur);
    }

    @GetMapping("/{id}")

    public ReclamationProf findReclamationProfById(@PathVariable Long id) {
        return reclamationProfService.findReclamationProfById(id);
    }
}
