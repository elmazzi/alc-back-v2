package ma.learn.quiz.dao;

import ma.learn.quiz.bean.SessionCours;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface SessionCoursDao extends JpaRepository<SessionCours, Long> {
    SessionCours findSessionCoursById(Long id);
     List<SessionCours> findByEtudiantId(Long id);

    SessionCours findSessionCoursByProfNom(String nom);
     int deleteSessionCoursById(Long id);
SessionCours findSessionCoursByCoursIdAndEtudiantIdAndProfId(Long idc, Long ids,Long idp);
    List<SessionCours> findByProfId(Long id);

    List<SessionCours> findByProfIdAndEtudiantId(Long id, Long ids);

    List<SessionCours> findSessionCoursByEtudiantId(Long id);
    List<SessionCours> findSessionCoursByDateFin(Date dateFin);

}