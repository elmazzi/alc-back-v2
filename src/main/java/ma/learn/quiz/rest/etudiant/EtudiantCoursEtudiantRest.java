package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.EtudiantCours;
import ma.learn.quiz.service.EtudiantCoursService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/etudiant/etudiantCours")
public class EtudiantCoursEtudiantRest {
	@Autowired
	private EtudiantCoursService etudiantCoursService;

	@GetMapping("/id/{id}/ids/{ids}")
	public EtudiantCours findByCoursIdAndEtudiantId(@PathVariable Long id,@PathVariable  Long ids) {
		return etudiantCoursService.findByCoursIdAndEtudiantId(id, ids);
	}
	@PostMapping("/")
	public int save(@RequestBody EtudiantCours etudiantCours) {
		return etudiantCoursService.save(etudiantCours);
	}
	@GetMapping("/")
	public List<EtudiantCours> findAll() {
		return etudiantCoursService.findAll();
	}

	
}
