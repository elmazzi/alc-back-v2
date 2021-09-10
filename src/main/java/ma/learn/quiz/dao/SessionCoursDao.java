package ma.learn.quiz.dao;

import ma.learn.quiz.bean.SessionCours;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface SessionCoursDao extends JpaRepository<SessionCours, Long> {
    SessionCours findSessionCoursById(Long id);

    int deleteSessionCoursById(Long id);
    List<SessionCours> findByProfId(Long id);

}