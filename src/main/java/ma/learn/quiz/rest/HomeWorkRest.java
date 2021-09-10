package ma.learn.quiz.rest;

import ma.learn.quiz.bean.HomeWork;
import ma.learn.quiz.service.HomeWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value = "learn/homeWork")
public class HomeWorkRest {

	@GetMapping("/id/{id}")
	public Optional<HomeWork> findById(@PathVariable Long id) {
		return homeWorkService.findById(id);
	}

	@Transactional
	@DeleteMapping("/id/{id}")
	public void deleteById(@PathVariable Long id) {
		homeWorkService.deleteById(id);
	}

	@GetMapping("/section/id/{id}")
	public HomeWork findBySectionId(@PathVariable Long id) {
		return homeWorkService.findBySectionId(id);
	}

	@GetMapping("/")
	public List<HomeWork> findAll() {
		return homeWorkService.findAll();
	}

	@PostMapping("/")
	public int save(@RequestBody HomeWork homeWork) {
		return homeWorkService.save(homeWork);
	}

	@Autowired
	private HomeWorkService homeWorkService;

}
