package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.TypeReclamationEtudiant;
import ma.learn.quiz.service.TypeReclamationEtudiantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/etudiant/typeReclamationEtudiantAdmin")
public class TypeReclamationEtudiantEtudiantRest {
    @Autowired
    private TypeReclamationEtudiantService typeReclamationEtudiantService;

    @GetMapping("/")

    public List<TypeReclamationEtudiant> findAll() {
        return typeReclamationEtudiantService.findAll();
    }
}
