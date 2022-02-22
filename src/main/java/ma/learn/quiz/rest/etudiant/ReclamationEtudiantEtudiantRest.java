package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.ReclamationEtudiant;
import ma.learn.quiz.service.ReclamationEtudiantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController

@RequestMapping("/etudiant/reclamationEtudiantEtudiant")
public class ReclamationEtudiantEtudiantRest {

    @Autowired
    private ReclamationEtudiantService reclamationEtudiantService;



    @GetMapping("/")

    public List<ReclamationEtudiant> findAll() {
        return reclamationEtudiantService.findAll();
    }

    @PostMapping("/")
    public int saveReclamationEtudiant(@RequestBody ReclamationEtudiant reclamationEtudiant) {
        return reclamationEtudiantService.saveReclamationEtudiant(reclamationEtudiant);
    }
    @GetMapping("/{id}")

    public List<ReclamationEtudiant> findReclamationEtudiantByEtudiantId(@PathVariable Long id) {
        return reclamationEtudiantService.findReclamationEtudiantByEtudiantId(id);
    }
    @GetMapping("/{id}/{idetudiant}")

    public ReclamationEtudiant findReclamationEtudiantByIdAndEtudiantId(@PathVariable Long id,@PathVariable Long idetudiant) {
        return reclamationEtudiantService.findReclamationEtudiantByIdAndEtudiantId(id, idetudiant);
    }
}

