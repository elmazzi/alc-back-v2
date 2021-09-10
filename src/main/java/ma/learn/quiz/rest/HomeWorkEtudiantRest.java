package ma.learn.quiz.rest;


import ma.learn.quiz.bean.HomeWorkEtudiant;
import ma.learn.quiz.bean.QuizEtudiant;
import ma.learn.quiz.service.HomeWorkEtudiantService;
import ma.learn.quiz.service.QuizEtudiantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value = "learn/homeWorkEtudiant")
public class HomeWorkEtudiantRest {

	@GetMapping("/id/{id}")
	public Optional<HomeWorkEtudiant> findById(@PathVariable Long id) {
		return homeWorkEtudiantService.findById(id);
	}

	@Transactional
	@DeleteMapping("/id/{id}")
	public void deleteById(@PathVariable Long id) {
		homeWorkEtudiantService.deleteById(id);
	}

	@GetMapping("/etudiant/id/{id}")
	public List<HomeWorkEtudiant> findByEtudiantId(@PathVariable Long id) {
		return homeWorkEtudiantService.findByEtudiantId(id);
	}

	@GetMapping("/homeWork/id/{id}")
	public List<HomeWorkEtudiant> findByHomeWorkId(@PathVariable Long id) {
		return homeWorkEtudiantService.findByHomeWorkId(id);
	}

	@Transactional
	@DeleteMapping("/homeWork/id/{id}")
	public int deleteByHomeWorkId(@PathVariable Long id) {
		return homeWorkEtudiantService.deleteByHomeWorkId(id);
	}

	@Transactional
	@DeleteMapping("/etudiant/id/{id}")
	public int deleteByEtudiantId(@PathVariable Long id) {
		return homeWorkEtudiantService.deleteByEtudiantId(id);
	}

	@GetMapping("/")
	public List<HomeWorkEtudiant> findAll() {
		return homeWorkEtudiantService.findAll();
	}

	@PostMapping("/")
	public int save(@RequestBody HomeWorkEtudiant homeWorkEtudiant) {
		return homeWorkEtudiantService.save(homeWorkEtudiant);
	}

	@GetMapping("/homeWork/id/{idHomeWork}/etudiant/id/{idEtudiant}")
	public Object findByCritere(@PathVariable Long idEtudiant, @PathVariable Long idHomeWork) {
		return homeWorkEtudiantService.findByCritere(idEtudiant, idHomeWork);
	}

	@Autowired
	private HomeWorkEtudiantService homeWorkEtudiantService;



}
