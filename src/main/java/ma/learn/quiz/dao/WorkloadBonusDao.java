package ma.learn.quiz.dao;

import ma.learn.quiz.bean.ClassAverageBonus;
import ma.learn.quiz.bean.WorkloadBonus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkloadBonusDao extends JpaRepository<WorkloadBonus,Long> {
 WorkloadBonus findWorkloadBonusById(Long id);
  WorkloadBonus findWorkloadBonusByNombreSession(int nombreSession);

 }
