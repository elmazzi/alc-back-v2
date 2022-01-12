package ma.learn.quiz.dao;

import ma.learn.quiz.bean.TrancheHoraireProf;
import ma.learn.quiz.bean.TypeDeQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TrancheHoraireProfDao extends JpaRepository<TrancheHoraireProf, Long>{

    public int deleteTrancheHoraireProfById(Long id);
    public List<TrancheHoraireProf> findByProfId(Long id );

}
