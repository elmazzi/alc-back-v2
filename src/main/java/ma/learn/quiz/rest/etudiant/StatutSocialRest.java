package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.StatutSocial;
import ma.learn.quiz.service.StatutSocialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/etudiant/statutSocial")
public class StatutSocialRest {
    @Autowired
    private StatutSocialService statutSocialService;
    @GetMapping("/")
    public List<StatutSocial> findAll() {
        return statutSocialService.findAll();
    }
}
