package ma.learn.quiz.dao;


import ma.learn.quiz.bean.PackStudent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PackStudentDao extends JpaRepository<PackStudent, Long> {

    PackStudent findPackStudentByCode(String code);
    PackStudent findPackStudentByPrix(Double prix);
    List<PackStudent> findPackStudentByForGroupe(boolean forgroupe);

    int deleteByCode(String code);
    int deleteByPrix(Double prix);
    int deleteByForGroupe(boolean forGroupe);
}
