package ma.learn.quiz.rest.prof;

import ma.learn.quiz.bean.EtatEtudiantSchedule;
import ma.learn.quiz.service.EtatEtudiantScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/prof/etatEtudiantSchedule")
public class EtatEtudiantScheduleProfRest {

	@Autowired
	private EtatEtudiantScheduleService etatEtudiantScheduleService;

	@DeleteMapping("/ref/{ref}")
	public int deleteByRef(String ref) {
		return etatEtudiantScheduleService.deleteByRef(ref);
	}

	@GetMapping("/ref/{ref}")
	public EtatEtudiantSchedule findByRef(String ref) {
		return etatEtudiantScheduleService.findByRef(ref);
	}

	@PostMapping("/")
	public int save(EtatEtudiantSchedule etatEtudiantSchedule) {
		return etatEtudiantScheduleService.save(etatEtudiantSchedule);
	}

	@GetMapping("/")
	public List<EtatEtudiantSchedule> findAll() {
		return etatEtudiantScheduleService.findAll();
	}

	@GetMapping("/id/{id}")
	public Optional<EtatEtudiantSchedule> findById(Long id) {
		return etatEtudiantScheduleService.findById(id);
	}

}
