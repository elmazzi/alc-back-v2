package ma.learn.quiz.rest.prof;

import ma.learn.quiz.bean.Paiement;
import ma.learn.quiz.service.PaiementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/prof/paiement")
public class PaiementProfRest {
    

	    @GetMapping("/")
	    public List<Paiement> findAll() {
	        return paiementService.findAll();
	    }

	@PostMapping("/")
	public int save(Long id) {
		return paiementService.save(id);
	}



	    @Autowired
	    private PaiementService paiementService;
}
