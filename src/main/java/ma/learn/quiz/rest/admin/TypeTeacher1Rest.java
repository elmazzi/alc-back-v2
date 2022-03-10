package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.TypeTeacher;
import ma.learn.quiz.service.TypeTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin/type/typeTeacher")
public class TypeTeacher1Rest {
    @Autowired
    private TypeTeacherService typeTeacherService;
    @PostMapping("/")
    public int save( @RequestBody TypeTeacher typeTeacher) {
        return typeTeacherService.save(typeTeacher);
    }
    @PutMapping("/")
    public int update(@RequestBody TypeTeacher typeTeacher) {
        return typeTeacherService.update(typeTeacher);
    }
    @DeleteMapping("/libelle/{libelle}")
    public int deleteByLibelle  (@PathVariable String libelle) {
        return typeTeacherService.deleteByLibelle(libelle);
    }
}
