package ma.learn.quiz.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import ma.learn.quiz.bean.ScheduleProf;

public interface ScheduleProfDao extends JpaRepository<ScheduleProf, Long> {
    ScheduleProf findByRef(String ref);

    List<ScheduleProf> findByProfId(Long id);

    List<ScheduleProf> findByGroupeEtudiantIdOrderByCoursNumeroOrder(Long id);


    int deleteByRef(String ref);
}

