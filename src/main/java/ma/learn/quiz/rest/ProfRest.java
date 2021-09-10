package ma.learn.quiz.rest;

import ma.learn.quiz.bean.Paiement;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.SessionCours;
import ma.learn.quiz.service.ProfService;
import ma.learn.quiz.vo.SalaryVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("learn/prof")
public class ProfRest {
    @GetMapping("/numero/{numro}")
    public Prof findByNumero(@PathVariable String numro) {
        return profService.findByNumero(numro);
    }
    @DeleteMapping("/numero/{numero}")
    public int deleteByNumero(@PathVariable String numero) {
        return profService.deleteByNumero(numero);
    }

    @GetMapping("/id/{id}")
    public Prof findProfById(@PathVariable Long id) {
        return profService.findProfById(id);
    }

    @GetMapping("/")
    public List<Prof> findAll() {
        return profService.findAll();
    }
    @PostMapping("/")
    public int save(@RequestBody Prof prof) {
        return profService.save(prof);
    }
    @PostMapping("/salary/{salaryVo}")
    public List<SessionCours> calcStatistique(@RequestBody SalaryVo salaryVo) {
		return profService.calcStatistique(salaryVo);
	}
    @GetMapping("/nom/{nom}")
    public List<Prof> findByNom(@PathVariable String nom) {
		return profService.findByNom(nom);
	}
	@GetMapping("/ref/{ref}")
    public Prof findByRef(@PathVariable String ref) {
        return profService.findByRef(ref);
    }
    @PostMapping("/delete-multiple-by-id")
    public int deleteProfById(@RequestBody List<Prof> prof) {
	return profService.deleteProfById(prof);
}
    @DeleteMapping("/id/{id}")
    public int deleteProfById(@PathVariable Long id) {
	return profService.deleteProfById(id);
}
    @GetMapping("/login/{login}/password/{password}")
    public Object findByCritere(@PathVariable String login,@PathVariable String password) {
	return profService.findByCritere(login,password);
}
    @PutMapping("/")
	public Prof update(@RequestBody Prof prof) {
	return profService.update(prof);
}
    @PostMapping("/search")
	public List<Prof> findByCriteria(@RequestBody Prof prof) {
		return profService.findByCriteria(prof);
	}

    @GetMapping("/paiement")
    public List<Paiement> paiementProfs() {
        return profService.paiementProfs();
    }
	@Autowired
    private ProfService profService;
	
	@GetMapping("/sessionNonPayer/prof/id/{idProf}")
	public List<SessionCours> findSessionsNonPayer(@PathVariable Long idProf) {
		return profService.findSessionsNonPayer(idProf);
	}
}