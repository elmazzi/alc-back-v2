package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.Admin;
import ma.learn.quiz.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/etudiant/admin")
public class AdminEtudiantRest {
    @GetMapping("/numero/{numro}")
    public Admin findByNumero(@PathVariable String ref) {
        return adminService.findByNumero(ref);
    }
@DeleteMapping("/numero/{numero}")
    public int deleteByNumero(@PathVariable String ref) {
        return adminService.deleteByNumero(ref);
    }

    public List<Admin> findAll() {
        return adminService.findAll();
    }
@PostMapping("/")
    public int save(@RequestBody Admin prof) throws MessagingException, IOException {
        return adminService.save(prof);
    }

@GetMapping("/login/{login}/password/{password}")
public Object findByCritere(@PathVariable String login,@PathVariable String password) {
	return adminService.findByCritere(login,password);
}

    @Autowired
    private AdminService adminService;
}
