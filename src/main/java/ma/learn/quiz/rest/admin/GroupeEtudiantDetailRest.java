package ma.learn.quiz.rest.admin;

import ma.learn.quiz.service.GroupeEtudiantDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;

@RestController
@RequestMapping("/admin/groupeEtudiantDetail")
public class GroupeEtudiantDetailRest {
    @Autowired
    private GroupeEtudiantDetailService groupeEtudiantDetailService;

    @DeleteMapping("/id/{id}")
    public int deleteGroupeEtudiantDetailById( @PathVariable  Long id) {
        return groupeEtudiantDetailService.deleteGroupeEtudiantDetailById(id);
    }
}
