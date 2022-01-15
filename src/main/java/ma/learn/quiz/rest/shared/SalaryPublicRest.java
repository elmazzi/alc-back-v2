package ma.learn.quiz.rest.shared;

import ma.learn.quiz.bean.Salary;
import ma.learn.quiz.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping("/public/salary")
public class SalaryPublicRest {
	@Autowired
	private SalaryService salaryService;




	@GetMapping("/{mois}/{annee}/{id}")
	public Salary findSalaryByMoisAndAnneeAndProfId(@PathVariable int mois, @PathVariable int annee, @PathVariable Long id) {
		return salaryService.findSalaryByMoisAndAnneeAndProfId(mois, annee, id);
	}
}
