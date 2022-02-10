package ma.learn.quiz.rest.prof;

import ma.learn.quiz.bean.Paiement;
import ma.learn.quiz.service.PaiementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/prof/paiement")
public class PaiementProfRest {


    @GetMapping("/")
    public List<Paiement> findAll() {
        return paiementService.findAll();
    }


    @GetMapping("/{id}")

    public List<Paiement> findPaiementByProfId(@PathVariable Long id) {
        return paiementService.findPaiementByProfId(id);
    }



    @GetMapping("/paiement/{mois}/{annee}/{profid}")

    public List<Paiement> findPaiementByMoisAndAnneeAndProfID(@PathVariable String mois, @PathVariable String annee, @PathVariable Long profid) {
        return paiementService.findPaiementByMoisAndAnneeAndProfID(mois, annee, profid);
    }

    @Autowired
    private PaiementService paiementService;
}
