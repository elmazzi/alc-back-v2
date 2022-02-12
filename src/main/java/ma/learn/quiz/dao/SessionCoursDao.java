package ma.learn.quiz.dao;

import ma.learn.quiz.bean.SessionCours;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface SessionCoursDao extends JpaRepository<SessionCours, Long> {
    SessionCours findSessionCoursById(Long id);

    SessionCours findSessionCoursByProfIdAndCoursIdAndGroupeEtudiantIdAndSalaryId(Long profid, Long coursid, Long groupEtudiant, Long salaryid);

    SessionCours findSessionCoursByProfNom(String nom);

    int deleteSessionCoursById(Long id);


    List<SessionCours> findByProfId(Long id);


    List<SessionCours> findSessionCoursByDateFin(Date dateFin);

    List<SessionCours> findSessionCoursBySalaryId(Long id);

    List<SessionCours> findSessionCoursByProfIdAndSalaryId(Long idprof, Long idsalary);
}