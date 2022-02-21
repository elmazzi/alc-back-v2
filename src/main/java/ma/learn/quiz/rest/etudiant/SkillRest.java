package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.InteretEtudiant;
import ma.learn.quiz.bean.Skill;
import ma.learn.quiz.service.InteretEtudiantService;
import ma.learn.quiz.service.SkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@RestController
@RequestMapping("/etudiant/skill")
public class SkillRest {
    @Autowired
    private SkillService skillService;
    @GetMapping("/")
    public List<Skill> findAll() {
        return skillService.findAll();
    }
}

