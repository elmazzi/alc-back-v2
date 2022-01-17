package ma.learn.quiz.service;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.SalaryDao;
import ma.learn.quiz.dao.WorkloadBonusDao;
import ma.learn.quiz.dao.WorkloadBonusProfDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class WorkloadBonusProfService {
    @Autowired
    private WorkloadBonusProfDao workloadBonusProfDao;
    @Autowired
    private ProfService profService;
    @Autowired
    private WorkloadBonusService workloadBonusService;

    public List<WorkloadBonusProf> findWorkloadBonusProfByMoisAndAnneeAndProfId(int mois, int annee, Long idprof) {
        return workloadBonusProfDao.findWorkloadBonusProfByMoisAndAnneeAndProfId(mois, annee, idprof);
    }

    public BigDecimal findAllWorkloadBonusProfByMoisAndAnneeAndProfId(int mois, int annee, Long idprof) {
        List<WorkloadBonusProf> workloadBonusProfs = findWorkloadBonusProfByMoisAndAnneeAndProfId(mois, annee, idprof);
        BigDecimal totalworkloadBonusProfs = new BigDecimal(0);
        for (WorkloadBonusProf workloadBonusProf : workloadBonusProfs) {
            totalworkloadBonusProfs = totalworkloadBonusProfs.add(workloadBonusProf.getWorkloadBonus().getPrix());
        }
        return totalworkloadBonusProfs;
    }

    public List<WorkloadBonusProf> findWorkloadBonusProfByProfId(Long id) {
        return workloadBonusProfDao.findWorkloadBonusProfByProfId(id);
    }

    public List<WorkloadBonusProf> findAll() {
        return workloadBonusProfDao.findAll();
    }

    public int save(Long idWorkloadBonus, Long idprof) {
        Prof prof = profService.findProfById(idprof);
        WorkloadBonus workloadBonus = workloadBonusService.findWorkloadBonusById(idWorkloadBonus);
        if (prof == null) {
            return -1;
        } else {
            if (workloadBonus == null) {
                return -2;
            } else {
                WorkloadBonusProf workloadBonusProf = new WorkloadBonusProf();
                workloadBonusProf.setProf(prof);
                workloadBonusProf.setWorkloadBonus(workloadBonus);
                workloadBonusProfDao.save(workloadBonusProf);
                return 1;
            }
        }
    }
}
