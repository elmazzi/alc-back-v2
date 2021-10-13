package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.Paiement;
import ma.learn.quiz.service.PaiementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin/paiement")
public class PaiementAdminRest {
	@PostMapping("/{id}")
	public int save(@PathVariable Long id) {
		return paiementService.save(id);
	}

	@GetMapping("/")
	    public List<Paiement> findAll() {
	        return paiementService.findAll();
	    }



	    @Autowired
	    private PaiementService paiementService;
}
