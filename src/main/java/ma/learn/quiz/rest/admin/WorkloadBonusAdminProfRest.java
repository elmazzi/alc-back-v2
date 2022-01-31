package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.WorkloadBonus;
import ma.learn.quiz.bean.WorkloadBonusProf;
import ma.learn.quiz.service.WorkloadBonusProfService;
import ma.learn.quiz.service.WorkloadBonusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/admin/workloadBonusProf")
public class WorkloadBonusAdminProfRest {
    @Autowired
    private WorkloadBonusProfService workloadBonusProfService;
    @GetMapping("/{mois}/{annee}/{idprof}")

    public List<WorkloadBonusProf> findWorkloadBonusProfByMoisAndAnneeAndProfId(@PathVariable int mois,@PathVariable int annee,@PathVariable Long idprof)  {
        return workloadBonusProfService.findWorkloadBonusProfByMoisAndAnneeAndProfId(mois, annee, idprof);
    }
    @GetMapping("/montant/{mois}/{annee}/{idprof}")

    public BigDecimal findAllWorkloadBonusProfByMoisAndAnneeAndProfId(@PathVariable int mois,@PathVariable int annee,@PathVariable Long idprof) {
        return workloadBonusProfService.findAllWorkloadBonusProfByMoisAndAnneeAndProfId(mois, annee, idprof);
    }
    @GetMapping("/{id}")

    public List<WorkloadBonusProf> findWorkloadBonusProfByProfId(@PathVariable Long id) {
        return workloadBonusProfService.findWorkloadBonusProfByProfId(id);
    }
    @GetMapping("/")

    public List<WorkloadBonusProf> findAll() {
        return workloadBonusProfService.findAll();
    }


}
