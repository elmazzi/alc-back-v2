package ma.learn.quiz.service;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import ma.learn.quiz.bean.Paiement;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.Salary;
import ma.learn.quiz.bean.SessionCours;
import ma.learn.quiz.service.Util.UtilString;
import ma.learn.quiz.service.vo.PaiementVo;
import ma.learn.quiz.service.vo.SalaryVo;
import ma.learn.quiz.service.vo.SessionCoursVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.dao.SalaryDao;

import javax.persistence.EntityManager;

@Service
public class SalaryService extends AbstractService{
    @Autowired
    private SalaryDao salaryDao;

    @Autowired
    private ProfService profService;
    @Autowired
    public EntityManager entityManager;

    public Salary findSalaryByMoisAndAnneeAndProfId(int mois, int annee, Long id) {
        return salaryDao.findSalaryByMoisAndAnneeAndProfId(mois, annee, id);
    }

    public List<Salary> findSalaryByAnneeAndProfId(int annee, Long id) {
        return salaryDao.findSalaryByAnneeAndProfId(annee, id);
    }

    public List<Salary> findSalaryByProfId(Long idprof) {
        return salaryDao.findSalaryByProfId(idprof);
    }

    public List<Salary> findAll() {
        return salaryDao.findAll();
    }

    public BigDecimal findAllMontantByProfId(Long profId) {
        Prof prof = profService.findProfById(profId);
        if (prof != null) {
            List<Salary> salaryList = findSalaryByProfId(profId);
            BigDecimal montantglobal = new BigDecimal(0);
            for (Salary salary : salaryList) {
                montantglobal = montantglobal.add(salary.getMontantMensuel());
            }
            return montantglobal;
        } else {
            return null;
        }
    }

    public List<Salary> findSalaryByAnnee(int annee) {
        return salaryDao.findSalaryByAnnee(annee);
    }

    public BigDecimal findMontantByAnneeAndProfId(int annee, Long idprof) {
        Prof prof = profService.findProfById(idprof);
        if (prof != null) {
            List<Salary> salaryList1 = findSalaryByAnneeAndProfId(annee, idprof);
            BigDecimal montantAnnee = new BigDecimal(0);
            if (salaryList1 != null) {
                for (Salary salary : salaryList1) {
                    montantAnnee = montantAnnee.add(salary.getMontantMensuel());
                }
                return montantAnnee;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    public Salary findSalaryByMoisAndAnnee(int mois, int annee) {
        return salaryDao.findSalaryByMoisAndAnnee(mois, annee);
    }


    public List<Salary> findAllByCriteria(SalaryVo salaryVo) {
        String query = this.init("Salary");
        if (salaryVo.getProf().getNom() != null) {
            query += this.addCriteria("prof.nom", salaryVo.getProf().getNom(), "LIKE");
        }
        if (salaryVo.getAnnee() != null) {
            query += this.addCriteria("annee", salaryVo.getAnnee(), "LIKE");
        }
        if (salaryVo.getMois() != null) {
            query += this.addCriteria("mois", salaryVo.getMois(), "LIKE");
        }


        System.out.println("query = " + query);


        return entityManager.createQuery(query).getResultList();


    }

}
