package ma.learn.quiz.dao;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.learn.quiz.bean.Salary;

@Repository
public interface SalaryDao extends JpaRepository<Salary, Long> {


    Salary findSalaryByMoisAndAnneeAndProfId(int mois, int annee, Long id);

    List<Salary> findSalaryByAnneeAndProfId(int annee, Long id);

    List<Salary> findSalaryByAnnee(int annee);

    List<Salary> findSalaryByProfId(Long idprof);

    Salary findSalaryByMoisAndAnnee(int mois, int annee);

    Salary findSalaryById(Long id);
    List<Salary> findSalaryByPayer(boolean payer);

}