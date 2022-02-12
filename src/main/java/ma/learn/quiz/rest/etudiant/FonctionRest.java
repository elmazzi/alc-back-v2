package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.Fonction;
import ma.learn.quiz.service.FonctionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/etudiant/fonction")
public class FonctionRest {
    @Autowired
    private FonctionsService fonctionsService;
    @GetMapping("/")
    public List<Fonction> findAll() {
        return fonctionsService.findAll();
    }
}
