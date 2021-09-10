package ma.learn.quiz.rest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.Quiz;
import ma.learn.quiz.bean.QuizEtudiant;
import ma.learn.quiz.service.QuizEtudiantService;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@RequestMapping(value = "learn/quizEtudiant")
public class QuizEtudiantRest {
	
	@Autowired
	private QuizEtudiantService quizEtudiantService;

	@GetMapping("/etudiant/{refEtudiant}/quiz/{refQuiz}")
	public Object findByCritere(@PathVariable String refEtudiant,@PathVariable String refQuiz) {
		return quizEtudiantService.findByCritere(refEtudiant, refQuiz);
	}

	@GetMapping("/resultat/{resultat}")
	public List<QuizEtudiant> findByResultat(String resultat) {
		return quizEtudiantService.findByResultat(resultat);
	}

	@GetMapping("/ref/{ref}")
	public QuizEtudiant findByRef(@PathVariable String ref) {
		return quizEtudiantService.findByRef(ref);
	}

	@DeleteMapping("/id/{id}")
	public int deleteById(@PathVariable Long id) {
		return quizEtudiantService.deleteById(id);
	}

	@GetMapping("/quiz/ref/{ref}")
	public List<QuizEtudiant> findByQuizRef(@PathVariable String ref) {
		return quizEtudiantService.findByQuizRef(ref);
	}


	@DeleteMapping("/quiz/ref/{ref}")
	public int deleteByQuizRef(@PathVariable String ref) {
		return quizEtudiantService.deleteByQuizRef(ref);
	}


	@PostMapping("/")
	public int save(@RequestBody QuizEtudiant quizEtudiant) {
		return quizEtudiantService.save(quizEtudiant);
	}

	@GetMapping("/")
	public List<QuizEtudiant> findAll() {
		return quizEtudiantService.findAll();
	}

	@PutMapping("/")
	public void update(@RequestBody QuizEtudiant quizEtudiant) {
		quizEtudiantService.update(quizEtudiant);
	}

	

}
