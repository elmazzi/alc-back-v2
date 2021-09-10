package ma.learn.quiz.rest;

import ma.learn.quiz.bean.Admin;
import ma.learn.quiz.bean.Paiement;
import ma.learn.quiz.service.AdminService;
import ma.learn.quiz.service.PaiementService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("learn/paiement")
public class PaiementRest {
    

	    @GetMapping("/")
	    public List<Paiement> findAll() {
	        return paiementService.findAll();
	    }

	    @PostMapping("/")
	    public int save(@RequestBody Paiement paiement) {
	        return paiementService.save(paiement);
	    }

	    @Autowired
	    private PaiementService paiementService;
}
