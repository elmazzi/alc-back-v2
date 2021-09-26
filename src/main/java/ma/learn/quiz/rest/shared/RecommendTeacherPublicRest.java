package ma.learn.quiz.rest.shared;

import ma.learn.quiz.bean.RecommendTeacher;
import ma.learn.quiz.service.RecommendTeacherService;
import ma.learn.quiz.service.vo.RecommendTeacherVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/public/teacher")
public class RecommendTeacherPublicRest {
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