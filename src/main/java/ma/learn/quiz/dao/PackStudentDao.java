package ma.learn.quiz.dao;


import com.sun.xml.bind.v2.runtime.reflect.Lister;
import ma.learn.quiz.bean.PackStudent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PackStudentDao extends JpaRepository<PackStudent, Long> {

    PackStudent findPackStudentByCode(String code);
    PackStudent findPackStudentByPrix(Double prix);
    List<PackStudent> findPackStudentByForGroupe(boolean forgroupe);
    PackStudent findPackStudentByLibelle(String libelle);
    List<PackStudent> findByTotalStudents(int totalStudents);
    List<PackStudent> findByLevelId(Long id);

    int deleteByCode(String code);
    int deleteByPrix(Double prix);
    int deleteByForGroupe(boolean forGroupe);
}
