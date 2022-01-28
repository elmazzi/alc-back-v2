package ma.learn.quiz.rest.prof;

import ma.learn.quiz.bean.ClassAverageBonusProf;
import ma.learn.quiz.service.ClassAverageBonusProfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/prof/classAverageBonusProf")
public class ClassAverageBonusProfProfRest {
    @Autowired
    private ClassAverageBonusProfService classAverageBonusProfService;
@GetMapping("/prof/id/{id}")
    public List<ClassAverageBonusProf> findClassAverageBonusProfByProfId(@PathVariable Long id) {
        return classAverageBonusProfService.findClassAverageBonusProfByProfId(id);
    }
    @GetMapping("/prof/mois/{mois}/annee/{annee}/idprof/{idprof}")

    public List<ClassAverageBonusProf> findClassAverageBonusProfByMoisAndAnneeAndProfId(@PathVariable int mois,@PathVariable int annee,@PathVariable Long idprof) {
        return classAverageBonusProfService.findClassAverageBonusProfByMoisAndAnneeAndProfId(mois, annee, idprof);
    }
    @GetMapping("/all/prof/mois/{mois}/annee/{annee}/idprof/{idprof}")

    public BigDecimal findMontantClassAverageBonusProfByMoisAndAnneeAndProfId(@PathVariable int mois,@PathVariable int annee,@PathVariable Long idprof) {
        return classAverageBonusProfService.findMontantClassAverageBonusProfByMoisAndAnneeAndProfId(mois, annee, idprof);
    }
    @GetMapping("/")

    public List<ClassAverageBonusProf> findAll() {
        return classAverageBonusProfService.findAll();
    }

}
