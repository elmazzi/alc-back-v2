package ma.learn.quiz.rest.prof;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.service.ProfService;
import ma.learn.quiz.service.UserServiceImpl;
import ma.learn.quiz.bean.Salary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/prof/prof")
public class ProfProfRest {
    @GetMapping("/{id}/{idcours}")


    public EtudiantCours findProfByEtuID(@PathVariable Long id,@PathVariable Long idcours) {
        return profService.findProfByEtuID(id, idcours);
    }

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
    public List<SessionCours> calcStatistique(@RequestBody Salary salaryVo) {
		return profService.calcStatistique(salaryVo);
	}
    @GetMapping("/nom/{nom}")
    public Prof findByNom(@PathVariable String nom) {
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

	@Autowired
    private ProfService profService;
	
	@GetMapping("/sessionNonPayer/prof/id/{idProf}")
	public List<SessionCours> findSessionsNonPayer(@PathVariable Long idProf) {
		return profService.findSessionsNonPayer(idProf);
	}

    @GetMapping("/connected-student")
    public Map<Long, User> getConnectedStudent(){
        System.out.println(this.userService.connectedStudent.size());
        return this.userService.connectedStudent;
    }

    @GetMapping("/remove-student/{id}")
    public Map<Long, User> removeStudentConnected(@PathVariable Long id){
        System.out.println( this.userService.connectedStudent.values().size());
        this.userService.connectedStudent.remove(id);
        System.out.println( this.userService.connectedStudent.values().size());
        return this.userService.connectedStudent;
    }

    @Autowired
    private UserServiceImpl userService;

}