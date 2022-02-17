package ma.learn.quiz.rest.prof;

import ma.learn.quiz.bean.ReclamationProf;
import ma.learn.quiz.service.ReclamationProfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController

@RequestMapping("/prof/reclamationProfAdmin")
public class ReclamationProfProfRest {
    @Autowired
    private ReclamationProfService reclamationProfService;

    @GetMapping("/")

    public List<ReclamationProf> findAll() {
        return reclamationProfService.findAll();
    }

    @PostMapping("/")
    public int saveReclamationProf(@RequestBody ReclamationProf reclamationProf) {
        return reclamationProfService.saveReclamationProf(reclamationProf);
    }
}
