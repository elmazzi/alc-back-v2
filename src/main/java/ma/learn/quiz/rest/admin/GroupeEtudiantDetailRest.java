package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.GroupeEtudiantDetail;
import ma.learn.quiz.service.GroupeEtudiantDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@RequestMapping("/admin/groupeEtudiantDetail")
public class GroupeEtudiantDetailRest {
    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;

    @DeleteMapping("/id/{id}")
    public int deleteGroupeEtudiantDetailById( @PathVariable  Long id) {
        return groupeEtudiantDetailService.deleteGroupeEtudiantDetailById(id);
    }

    @PostMapping("/search/")
    public List<GroupeEtudiantDetail> findByCriteria(@RequestBody GroupeEtudiantDetail groupeEtudiantDetail) {
        return groupeEtudiantDetailService.findByCriteria(groupeEtudiantDetail);
    }
}
