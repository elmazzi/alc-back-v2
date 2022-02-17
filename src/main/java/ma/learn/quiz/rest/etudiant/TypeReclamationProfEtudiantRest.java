package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.TypeReclamationProf;
import ma.learn.quiz.service.TypeReclamationProfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/etudiant/typeReclamationProfAdmin")
public class TypeReclamationProfEtudiantRest {
    @Autowired
    private TypeReclamationProfService typeReclamationProfService;

    @GetMapping("/")
    public List<TypeReclamationProf> findAll() {
        return typeReclamationProfService.findAll();
    }
}
