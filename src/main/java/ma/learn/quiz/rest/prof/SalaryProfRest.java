package ma.learn.quiz.rest.prof;

import ma.learn.quiz.bean.Salary;
import ma.learn.quiz.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/prof/salary")
public class SalaryProfRest {
    @Autowired
    private SalaryService salaryService;
    @GetMapping("/prof/idprof/{idprof}")

    public List<Salary> findSalaryByProfId(@PathVariable Long idprof) {
        return salaryService.findSalaryByProfId(idprof);
    }

    @GetMapping("/{mois}/{annee}/{id}")
    public Salary findSalaryByMoisAndAnneeAndProfId(@PathVariable int mois, @PathVariable int annee, @PathVariable Long id) {
        return salaryService.findSalaryByMoisAndAnneeAndProfId(mois, annee, id);
    }

    @GetMapping("/current/{id}")
    public Salary findCurrentSalaryByMoisAndAnneeAndProfId(@PathVariable Long id) {
        LocalDateTime now= LocalDateTime.now();
        return salaryService.findSalaryByMoisAndAnneeAndProfId(now.getMonthValue(), now.getYear(), id);
    }

    @GetMapping("/")

    public List<Salary> findAll() {
        return salaryService.findAll();
    }

    @GetMapping("/id/{annee}/{idprof}")

    public BigDecimal findMontantByAnneeAndProfId(@PathVariable int annee, @PathVariable Long idprof) {
        return salaryService.findMontantByAnneeAndProfId(annee, idprof);
    }
    @GetMapping("/allSalaryProf/idprof/{profId}")
    public BigDecimal findAllMontantByProfId(@PathVariable Long profId) {
        return salaryService.findAllMontantByProfId(profId);
    }

    @GetMapping("/{mois}/{annee}")
    public Salary findSalaryByMoisAndAnnee(@PathVariable int mois, @PathVariable int annee) {
        return salaryService.findSalaryByMoisAndAnnee(mois, annee);
    }
}
