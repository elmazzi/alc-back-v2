package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.FaqType;
import ma.learn.quiz.bean.GroupeEtudiantDetail;
import ma.learn.quiz.service.FaqTypeService;
import ma.learn.quiz.service.GroupeEtudiantDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/etudiant/groupeEtudiantDetail/")
public class EtudiantGroupeEtudiantDetailRest {
    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;


    @GetMapping("groupeEtudiant/id/{id}")
    public List<GroupeEtudiantDetail> findByGroupeEtudiantId(@PathVariable Long id) {
        return groupeEtudiantDetailService.findByGroupeEtudiantId(id);
    }


    @GetMapping("etudiant/id/{id}")
    public List<GroupeEtudiantDetail> findByEtudiantId(@PathVariable Long id) {
        return groupeEtudiantDetailService.findByEtudiantId(id);
    }
}
