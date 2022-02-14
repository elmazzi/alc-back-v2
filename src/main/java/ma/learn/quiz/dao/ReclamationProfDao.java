package ma.learn.quiz.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

import ma.learn.quiz.bean.ReclamationProf;


@Repository
public interface ReclamationProfDao extends JpaRepository<ReclamationProf, Long> {

ReclamationProf findReclamationProfById(Long id);

}
