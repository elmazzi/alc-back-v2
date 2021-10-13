package ma.learn.quiz.rest.etudiant;



import ma.learn.quiz.bean.EtudiantReview;
import ma.learn.quiz.service.EtudiantReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/etudiant/etudiantReview")
public class EtudiantReviewEtudiantRest {
    @Autowired
    public EtudiantReviewService etudiantReviewService;
    @GetMapping("/review/{review}")
    public EtudiantReview findByReview(@PathVariable int review) {
        return etudiantReviewService.findByReview(review);
    }
    @DeleteMapping("/review/{review}")
    public int deleteByReview( @PathVariable int review) {
        return etudiantReviewService.deleteByReview(review);
    }
    @GetMapping("/")
    public List<EtudiantReview> findAll() {
        return etudiantReviewService.findAll();
    }

    @PostMapping("/{idprof}/{idstudent}/{idcours}/{comment}")
    public int save(@PathVariable Long idprof,@PathVariable Long idstudent,@PathVariable Long idcours,@PathVariable String comment) {
        return etudiantReviewService.save(idprof, idstudent, idcours, comment);
    }

    @GetMapping("/{id}")

    public List<EtudiantReview> findEtudiantReviewByProfId(@PathVariable Long id) {
        return etudiantReviewService.findEtudiantReviewByProfId(id);
    }
    @GetMapping("/etudiant/id/{id}/cours/id/{ids}")
    public EtudiantReview findByEtudiantIdAndCoursId(@PathVariable long id,@PathVariable long ids) {
        return etudiantReviewService.findByEtudiantIdAndCoursId(id, ids);
    }
    @GetMapping("/prof/id/{id}/student/id/{ids}/cours/idc/{idc}")

    public EtudiantReview findEtudiantReviewByProfIdAndEtudiantIdAndCoursId(@PathVariable long id,@PathVariable long ids,@PathVariable long idc) {
        return etudiantReviewService.findEtudiantReviewByProfIdAndEtudiantIdAndCoursId(id, ids, idc);
    }
}
