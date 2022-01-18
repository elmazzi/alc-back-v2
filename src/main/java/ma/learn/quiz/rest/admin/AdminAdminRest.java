package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.Admin;
import ma.learn.quiz.service.AdminService;
import miniApp.migration.DataBaseMigration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/admin/admin")
@CrossOrigin("http://localhost:4200")
public class AdminAdminRest {
    @GetMapping("/numero/{numro}")
    public Admin findByNumero(@PathVariable String ref) {
        return adminService.findByNumero(ref);
    }

    @DeleteMapping("/numero/{numero}")
    public int deleteByNumero(@PathVariable String ref) {
        return adminService.deleteByNumero(ref);
    }


    @GetMapping("/")
    public List<Admin> findAll() {
        return adminService.findAll();
    }


    @PostMapping("/")
    public int save(@RequestBody Admin admin) {
        System.out.println(admin.getNom());
        System.out.println(admin.getUsername());
        return adminService.save(admin);
    }

    @GetMapping("/login/{login}/password/{password}")
    public Object findByCritere(@PathVariable String login, @PathVariable String password) {
        return adminService.findByCritere(login, password);
    }
    @Autowired
    private DataBaseMigration dataBaseMigration;


    @GetMapping("/app")
    public void start() {
        dataBaseMigration.htmlimagetext();
    }
    @Autowired
    private AdminService adminService;
}
