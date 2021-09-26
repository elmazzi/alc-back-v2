package ma.learn.quiz.rest.admin;



import ma.learn.quiz.bean.EtudiantReview;
import ma.learn.quiz.service.EtudiantReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin/etudiantReview")
public class EtudiantReviewAdminRest {
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

    @PostMapping("/")
    public int save(@RequestBody EtudiantReview etudiantReview) {
        return etudiantReviewService.save(etudiantReview);
    }

    @GetMapping("/etudiant/id/{id}/cours/id/{ids}")
    public EtudiantReview findByEtudiantIdAndCoursId(@PathVariable long id,@PathVariable long ids) {
        return etudiantReviewService.findByEtudiantIdAndCoursId(id, ids);
    }
}
