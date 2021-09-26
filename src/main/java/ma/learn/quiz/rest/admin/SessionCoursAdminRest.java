package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.SessionCours;
import ma.learn.quiz.service.SessionCoursService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin/session")
public class SessionCoursAdminRest {

    @GetMapping("/id/{id}")
    public SessionCours findSessionCoursById(@PathVariable Long id) {
        return sessionCoursService.findSessionCoursById(id);
    }
    @PostMapping("/search")
    public List<SessionCours> findByCriteria(@RequestBody SessionCours sessionCours) {
		return sessionCoursService.findByCriteria(sessionCours);
	}

	@PostMapping("/")
    public int save(@RequestBody SessionCours sessionCours) {
        return sessionCoursService.save(sessionCours);
    }

    @PutMapping("/")
    public SessionCours update(@RequestBody SessionCours sessionCours) {
        return sessionCoursService.update(sessionCours);
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

    @Autowired
    private SessionCoursService sessionCoursService;
}
