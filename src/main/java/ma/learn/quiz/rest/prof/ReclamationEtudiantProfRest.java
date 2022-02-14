package ma.learn.quiz.rest.prof;

import ma.learn.quiz.bean.ReclamationEtudiant;
import ma.learn.quiz.service.ReclamationEtudiantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController

@RequestMapping("/prof/reclamationEtudiantAdmin")
public class ReclamationEtudiantProfRest {

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
}
