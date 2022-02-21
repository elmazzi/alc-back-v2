package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.ReclamationEtudiant;
import ma.learn.quiz.service.ReclamationEtudiantService;
import ma.learn.quiz.service.vo.ReclamationEtudiantVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/admin/reclamationEtudiantAdmin")
public class ReclamationEtudiantAminRest {
    @Autowired
    private ReclamationEtudiantService reclamationEtudiantService;

    @PutMapping("/update/{dateTraitementforEtudiant}")

    public int reponseReclamationEtudiant(@RequestBody ReclamationEtudiant reclamationEtudiant, @PathVariable Date dateTraitementforEtudiant) {
        return reclamationEtudiantService.reponseReclamationEtudiant(reclamationEtudiant,dateTraitementforEtudiant);
    }

    @GetMapping("/")

    public List<ReclamationEtudiant> findAll() {
        return reclamationEtudiantService.findAll();
    }

    @GetMapping("/{id}")

    public ReclamationEtudiant findReclamationEtudiantById(@PathVariable Long id) {
        return reclamationEtudiantService.findReclamationEtudiantById(id);
    }

    @GetMapping("/{id}/{idetudiant}")
    public ReclamationEtudiant findReclamationEtudiantByIdAndEtudiantId(@PathVariable Long id, @PathVariable Long idetudiant) {
        return reclamationEtudiantService.findReclamationEtudiantByIdAndEtudiantId(id, idetudiant);
    }

    @PostMapping("/byCriteria")
    public List<ReclamationEtudiant> findAllByCriteria(@RequestBody ReclamationEtudiantVo reclamationEtudiantVo) {
        return reclamationEtudiantService.findAllByCriteria(reclamationEtudiantVo);
    }
}
