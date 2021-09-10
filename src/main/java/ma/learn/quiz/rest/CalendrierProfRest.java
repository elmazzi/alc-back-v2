package ma.learn.quiz.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ma.learn.quiz.bean.CalendrierProf;
import ma.learn.quiz.service.CalendrierProfService;
import ma.learn.quiz.vo.CalendrierVo;

@RestController
@RequestMapping("learn/calendrierProf")
public class CalendrierProfRest {
    @DeleteMapping("/id/{id}")
	public int deleteCalendrierProfById(Long id) {
		return calendrierProfService.deleteCalendrierProfById(id);
	}
    @GetMapping("/prof/id/{id}")
	public List<CalendrierProf> findByProfId(@PathVariable Long id) {
		return calendrierProfService.findByProfId(id);
	}
    @GetMapping("/etudiant/id/{id}")
    public List<CalendrierProf> findByEtudiantId(@PathVariable Long id) {
		return calendrierProfService.findByEtudiantId(id);
	}
	@GetMapping("/vo/etudiant/id/{id}")
	public List<CalendrierVo> findScheduleEtudiant(@PathVariable long id) {
		return calendrierProfService.findScheduleEtudiant(id);
	}
	@PutMapping("/")
	public CalendrierProf update(@RequestBody CalendrierProf calendrierProf) {
		return calendrierProfService.update(calendrierProf);
	}
	@GetMapping("/vo/")
	public List<CalendrierVo> findAllSchedule() {
		return calendrierProfService.findAllSchedule();
	}
	@GetMapping("/vo/id/{id}")
	public List<CalendrierVo> findSchedule(@PathVariable long id) {
		return calendrierProfService.findSchedule(id);
	}

	@GetMapping("/ref/{ref}")
	public CalendrierProf findByRef(@PathVariable String ref) {
		return calendrierProfService.findByRef(ref);
	}

	@DeleteMapping("/ref/{ref}")
	public int deleteByRef(@PathVariable String ref) {
		return calendrierProfService.deleteByRef(ref);
	}

	@PostMapping("/")
	public int save(@RequestBody CalendrierProf calendrierProf) {
		return calendrierProfService.save(calendrierProf);
	}

	@GetMapping("/")
	public List<CalendrierProf> findAll() {
		return calendrierProfService.findAll();
	}

	@Autowired
	private CalendrierProfService calendrierProfService;
}
