package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.NiveauEtude;
import ma.learn.quiz.service.NiveauEtudeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/etudiant/niveauEtude")
public class NiveauEtudeRest {
    @Autowired
    private NiveauEtudeService niveauEtudeService;
    @GetMapping("/")
    public List<NiveauEtude> findAll() {
        return niveauEtudeService.findAll();
    }
}
