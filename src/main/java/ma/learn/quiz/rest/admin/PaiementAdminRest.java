package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.Paiement;
import ma.learn.quiz.service.PaiementService;
import ma.learn.quiz.service.vo.PaiementVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

	@Autowired
	    private PaiementService paiementService;
}
