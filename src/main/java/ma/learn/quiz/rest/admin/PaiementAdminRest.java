package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.Paiement;
import ma.learn.quiz.service.PaiementService;
import ma.learn.quiz.service.vo.PaiementVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/admin/paiement")
public class PaiementAdminRest {
    @GetMapping("/{id}")
    public int save(@PathVariable Long id) {
        return paiementService.save(id);
    }

    @GetMapping("/")
    public List<Paiement> findAll() {
        return paiementService.findAll();
    }

    @PostMapping("/ByCriteria")
    public List<Paiement> findAllByCriteria(@RequestBody PaiementVo paiementVo) {
        return paiementService.findAllByCriteria(paiementVo);
    }
    @GetMapping("/detailspaiementByidProf/{mois}/{annee}/{profid}")

    public List<Paiement> findPaiementByMoisAndAnneeAndProfID(@PathVariable String mois,@PathVariable String annee,@PathVariable Long profid) {
        return paiementService.findPaiementByMoisAndAnneeAndProfID(mois, annee, profid);
    }
    @GetMapping("/allMontant/{mois}/{annee}/{profid}")
    public BigDecimal findAllPaiementByMoisAndAnneeAndProfID(@PathVariable String mois,@PathVariable String annee,@PathVariable Long profid) {
        return paiementService.findAllPaiementByMoisAndAnneeAndProfID(mois, annee, profid);
    }





    @Autowired
    private PaiementService paiementService;
}
