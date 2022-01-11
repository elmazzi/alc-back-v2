package ma.learn.quiz.service;

import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.TrancheHoraireProf;
import ma.learn.quiz.dao.TrancheHoraireProfDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class TrancheHoraireProfService {
    @Autowired
    private TrancheHoraireProfDao trancheHoraireProfDao;
    public void save(Prof prof , List<TrancheHoraireProf> trancheHoraireProfList)
    {
        for (TrancheHoraireProf trancheHoraireProf : trancheHoraireProfList){
            trancheHoraireProf.setProf(prof);
            trancheHoraireProfDao.save(trancheHoraireProf);
        }
    }
   @Transactional
    public int deleteTrancheHoraireProfById(Long id) {
        return trancheHoraireProfDao.deleteTrancheHoraireProfById(id);
    }

    public List<TrancheHoraireProf> findByProfId(Long id) {
        return trancheHoraireProfDao.findByProfId(id);
    }
}
