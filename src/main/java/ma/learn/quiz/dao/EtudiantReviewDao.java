package ma.learn.quiz.dao;

import ma.learn.quiz.bean.EtudiantReview;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EtudiantReviewDao extends JpaRepository<EtudiantReview, Long> {
    EtudiantReview findByReview(int review);

    List<EtudiantReview> findEtudiantReviewByProfId(Long id);

    int deleteByReview(int review);

    EtudiantReview findByEtudiantIdAndCoursId(long id, long ids);

    EtudiantReview findEtudiantReviewByProfIdAndEtudiantIdAndCoursId(long id, long ids,long idc);
}
