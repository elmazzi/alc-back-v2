package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.GroupeEtude;
import ma.learn.quiz.bean.GroupeEtudiant;
import ma.learn.quiz.bean.GroupeEtudiantDetail;
import ma.learn.quiz.service.GroupeEtudiantDetailService;
import ma.learn.quiz.service.GroupeEtudiantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;
@RestController
@RequestMapping("/admin/groupeEtudiant")
public class GroupeEtudiantRest {
    @Autowired
    private GroupeEtudiantService groupeEtudiantService ;
    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;
    @PostMapping("/")
    public int save(@RequestBody  GroupeEtudiant groupeEtudiant) {
        return groupeEtudiantService.save(groupeEtudiant);
    }
    @GetMapping("/")
    public List<GroupeEtudiant> findAll() {
        return groupeEtudiantService.findAll();
    }
    @GetMapping("/id/{id}")
    public List<GroupeEtudiantDetail> findByGroupeEtudiantId(@PathVariable Long id) {
        return groupeEtudiantDetailService.findByGroupeEtudiantId(id);
    }
    @DeleteMapping("/id/{id}")
    public int deleteGroupeEtudiantById(@PathVariable Long id) {
        return groupeEtudiantService.deleteGroupeEtudiantById(id);
    }
    @PostMapping("/delete-multiple-by-id")
    public int deleteGroupeEtudeById( @RequestBody List<GroupeEtudiant> groupeEtudiant) {
        return groupeEtudiantService.deleteGroupeEtudiantById(groupeEtudiant);
    }
    @PutMapping("/")
    public int update(@RequestBody  GroupeEtudiant groupeEtudiant) {
        return groupeEtudiantService.update(groupeEtudiant);
    }
    @GetMapping("/libelle/{libelle}/nombrePlacevide/{nombrePlacevide}")
    public List<GroupeEtudiant> findByParcoursIdAndNombrePlacevideGreaterThan(Long id, Long nombrePlacevide) {
        return groupeEtudiantService.findByParcoursIdAndNombrePlacevideGreaterThan(id, nombrePlacevide);
    }
}
