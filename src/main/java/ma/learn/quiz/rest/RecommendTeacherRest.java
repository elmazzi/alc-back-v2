package ma.learn.quiz.rest;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.RecommendTeacher;
import ma.learn.quiz.service.RecommendTeacherService;
import ma.learn.quiz.service.vo.EtudiantVo;
import ma.learn.quiz.service.vo.RecommendTeacherVo;

@RestController
@RequestMapping("learn/teacher")
public class RecommendTeacherRest {
	@Autowired
	private RecommendTeacherService recommendTeacherService ;
	/*
	@GetMapping("prof/nom/{nom}")
	 public RecommendTeacher findByProfNom(String nom) {
		return recommendTeacherService.findByProfNom(nom);
	}
	*/
	@GetMapping("/id/{id}")
	public Optional<RecommendTeacher> findById(Long id) {
		return recommendTeacherService.findById(id);
	}
	/*
	public RecommendTeacher update(RecommendTeacher recommendTeacher) {
		return recommendTeacherService.update(recommendTeacher);
	}
	*/
	/*
	@GetMapping("/ref/{ref}")
	public RecommendTeacher findByRef(@PathVariable String ref) {
		return recommendTeacherService.findByRef(ref);
	}
	*/
	
	
	 @GetMapping("/")
	public List<RecommendTeacher> findAll() {
		return recommendTeacherService.findAll();
	}
	 @PostMapping("/search")
	 public List<RecommendTeacher> findByCriteria(@RequestBody RecommendTeacherVo recommendTeacherVo) {
		return recommendTeacherService.findByCriteria(recommendTeacherVo);
	}
	@PostMapping("/")
	public int save(@RequestBody RecommendTeacher recommendTeacher) {
		return recommendTeacherService.save(recommendTeacher);
	}
	  @PutMapping("/")
	public void update(@RequestBody RecommendTeacher recommendTeacher) {
		recommendTeacherService.update(recommendTeacher);
	}

	  @GetMapping("/Prof/id/{id}")
	public List<RecommendTeacher> findRecommendTeacherByProfId(@PathVariable Long id) {
		return recommendTeacherService.findRecommendTeacherByProfId(id);
	}
	
	

}