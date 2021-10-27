package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.Cours;
import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.SessionCours;
import ma.learn.quiz.service.SessionCoursService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/etudiant/session")
public class SessionCoursEtudiantRest {
    @GetMapping("/prof/nom/{nom}")

    public SessionCours findSessionCoursByProfNom(@PathVariable String nom) {
        return sessionCoursService.findSessionCoursByProfNom(nom);
    }

    @GetMapping("/id/{id}")
    public SessionCours findSessionCoursById(@PathVariable Long id) {
        return sessionCoursService.findSessionCoursById(id);
    }
    @PostMapping("/search")
    public List<SessionCours> findByCriteria(@RequestBody SessionCours sessionCours) {
		return sessionCoursService.findByCriteria(sessionCours);
	}



    @GetMapping("/update/{id}")
    public int update(@PathVariable Long id) {
        return sessionCoursService.update(id);
    }
    @GetMapping("/prof/id/{id}")
    public List<SessionCours> findByProfId(@PathVariable Long id) {
        return sessionCoursService.findByProfId(id);
    }

    @GetMapping("/")
    public List<SessionCours> findAll() {
        return sessionCoursService.findAll();
    }

    @DeleteMapping("/id/{id}")
    public int deleteSessionCoursById(@PathVariable Long id) {
        return sessionCoursService.deleteSessionCoursById(id);
    }

    @PostMapping("/delete-multiple-by-id")
    public int deleteSessionCoursById(@RequestBody List<SessionCours> sessionCourss) {
        return sessionCoursService.deleteSessionCoursById(sessionCourss);
    }
    @GetMapping("/prof/id/{id}/etudiant/id/{ids}")
    public List<SessionCours> findByProfIdAndEtudiantId(@PathVariable Long id,@PathVariable Long ids) {
        return sessionCoursService.findByProfIdAndEtudiantId(id, ids);
    }
    @GetMapping("/etudiant/id/{id}")

    public List<SessionCours> findSessionCoursByEtudiantId(@PathVariable Long id) {
        return sessionCoursService.findSessionCoursByEtudiantId(id);
    }
    @GetMapping("/{profid}/{etudiantid}/{coursid}")
    public int save(@PathVariable Long profid,@PathVariable Long etudiantid,@PathVariable Long coursid) {
        return sessionCoursService.save(profid, etudiantid,coursid);
    }

    @GetMapping("/idc/{idc}/ids/{ids}/idp/{idp}")

    public SessionCours findSessionCoursByCoursIdAndEtudiantIdAndProfId(@PathVariable  Long idc,@PathVariable  Long ids,@PathVariable  Long idp) {
        return sessionCoursService.findSessionCoursByCoursIdAndEtudiantIdAndProfId(idc, ids, idp);
    }

    @Autowired
    private SessionCoursService sessionCoursService;
}
