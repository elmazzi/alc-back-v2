package ma.learn.quiz.rest.admin;


import ma.learn.quiz.bean.PackStudent;
import ma.learn.quiz.service.PackStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("packStudent/")
public class PackStudentAdminRest {

    @Autowired
    private PackStudentService packStudentService;


    @GetMapping("code/{code}")
    public PackStudent findPackStudentByCode(@PathVariable String code) {
        return packStudentService.findPackStudentByCode(code);
    }

    @GetMapping("prix/{prix}")
    public PackStudent findPackStudentByPrix(@PathVariable Double prix) {
        return packStudentService.findPackStudentByPrix(prix);
    }

    @GetMapping("packForgroupe/{forgroupe}")
    public List<PackStudent> findPackStudentByForGroupe(@PathVariable boolean forgroupe) {
        return packStudentService.findPackStudentByForGroupe(forgroupe);
    }

    @PostMapping("/")
    public int save(PackStudent packStudent) {
        return packStudentService.save(packStudent);
    }

    @PutMapping("/")
    public int update(PackStudent packStudent) {
        return packStudentService.update(packStudent);
    }

    @DeleteMapping("/code/{code}")
    public int deleteByCode(@PathVariable String code) {
        return packStudentService.deleteByCode(code);
    }

    @DeleteMapping("prix/{prix}")
    public int deleteByPrix(@PathVariable Double prix) {
        return packStudentService.deleteByPrix(prix);
    }

    @DeleteMapping("forgroupe/{forGroupe}")
    public int deleteByForGroupe(@PathVariable boolean forGroupe) {
        return packStudentService.deleteByForGroupe(forGroupe);
    }
}
