package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.InteretEtudiant;
import ma.learn.quiz.service.InteretEtudiantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/etudiant/interetEtudiant")
public class InteretEtudiantRest {
    @Autowired
    private InteretEtudiantService interetEtudiantService;
    @GetMapping("/")
    public List<InteretEtudiant> findAll() {
        return interetEtudiantService.findAll();
    }
}
