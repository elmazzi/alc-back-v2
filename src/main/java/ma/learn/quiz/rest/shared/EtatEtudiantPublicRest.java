package ma.learn.quiz.rest.shared;


import ma.learn.quiz.bean.EtatEtudiant;
import ma.learn.quiz.service.EtatEtudiantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/public/etat")
public class EtatEtudiantPublicRest {
    @GetMapping("/reference/{reference}")
    public EtatEtudiant findByReference(@PathVariable String reference) {
        return etatEtudiantService.findByReference(reference);
    }

    @PostMapping("/")

    public EtatEtudiant save(@RequestBody EtatEtudiant etatEtudiant) {
        return etatEtudiantService.save(etatEtudiant);
    }

    @PutMapping("/")

    public EtatEtudiant update(@RequestBody EtatEtudiant etatEtudiant) {
        return etatEtudiantService.update(etatEtudiant);
    }

    @GetMapping("/")

    public List<EtatEtudiant> findAll() {
        return etatEtudiantService.findAll();
    }

    @DeleteMapping("/reference/{reference}")
    public int deleteByReference(@PathVariable String reference) {
        return etatEtudiantService.deleteByReference(reference);
    }

    @PostMapping("/delete-multiple-by-reference")
    public int deleteByReference(@RequestBody List<EtatEtudiant> etatEtudiants) {
        return etatEtudiantService.deleteByReference(etatEtudiants);
    }

    @Autowired
    private EtatEtudiantService etatEtudiantService;
}
