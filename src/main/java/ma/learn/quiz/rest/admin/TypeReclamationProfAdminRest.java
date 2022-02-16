package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.TypeReclamationEtudiant;
import ma.learn.quiz.bean.TypeReclamationProf;
import ma.learn.quiz.service.TypeReclamationEtudiantService;
import ma.learn.quiz.service.TypeReclamationProfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin/typeReclamationProfAdmin")
public class TypeReclamationProfAdminRest {
    @Autowired
    private TypeReclamationProfService typeReclamationProfService;
    @GetMapping("/{code}")
    public TypeReclamationProf findTypeReclamationProfByCode(@PathVariable String code) {
        return typeReclamationProfService.findTypeReclamationProfByCode(code);
    }

    @DeleteMapping("/{id}")
    public int deleteTypeReclamationProfById(@PathVariable Long id) {
        return typeReclamationProfService.deleteTypeReclamationProfById(id);
    }
    @PostMapping("/")

    public int saveTypeReclamationProf(@RequestBody TypeReclamationProf typeReclamationProf) {
        return typeReclamationProfService.saveTypeReclamationProf(typeReclamationProf);
    }
    @GetMapping("/")


    public List<TypeReclamationProf> findAll() {
        return typeReclamationProfService.findAll();
    }
}
