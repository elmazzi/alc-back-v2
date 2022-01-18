package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.TrancheHoraireProf;
import ma.learn.quiz.service.TrancheHoraireProfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@RequestMapping("/admin/trancheHoraireProfRest")
public class TrancheHoraireProfRest {
    @Autowired
    private TrancheHoraireProfService trancheHoraireProfService;
    @GetMapping("/id/{id}")
    public List<TrancheHoraireProf> findByProfId(@PathVariable Long id) {
        return trancheHoraireProfService.findByProfId(id);
    }

    @PostMapping("/")
    public TrancheHoraireProf edit(@RequestBody  TrancheHoraireProf trancheHoraireProf) {
        return trancheHoraireProfService.edit(trancheHoraireProf);
    }

    @DeleteMapping("/id/{id}")
    public int deleteTrancheHoraireProfById( @PathVariable Long id) {
        return trancheHoraireProfService.deleteTrancheHoraireProfById(id);
    }
}
