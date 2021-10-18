package ma.learn.quiz.service;

import java.util.ArrayList;
import java.util.List;

import ma.learn.quiz.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ma.learn.quiz.dao.ScheduleProfDao;
import ma.learn.quiz.vo.SchdeduleVo;

@Service
public class ScheduleProfService {

	public ScheduleProf findByRef(String ref) {
		return scheduleProfDao.findByRef(ref);
	}

	@Transactional
	public int deleteByRef(String ref) {
		return scheduleProfDao.deleteByRef(ref);
	}



	public int save(ScheduleProf scheduleProf) {
		if (scheduleProf.getId() == null  || scheduleProf.getId() == 0 ){
			Etudiant etudiant = etudiantService.findEtudiantById(scheduleProf.getEtudiant().getId());
			Prof prof = profService.findProfById(scheduleProf.getProf().getId());
			EtatEtudiantSchedule etatEtudiantSchedule = etatEtudiantScheduleService
					.findByRef(scheduleProf.getEtudiant().getEtatEtudiantSchedule().getRef());
			if (etudiant != null){
				scheduleProf.setEtudiant(etudiant);
			}else{
				return -3;
			}
			if (prof != null){
				scheduleProf.setProf(prof);
			}else{
				return -2;
			}
			if (findByRef(scheduleProf.getRef()) != null) {
				return -1;
			} else {
				etudiantService.save(etudiant);
				etatEtudiantScheduleService.update(etatEtudiantSchedule);
				scheduleProfDao.save(scheduleProf);
				return 1;
			}
		}  else{
			this.update(scheduleProf);
			return 0 ;
		}

	}

	public int saveAll(ScheduleProf scheduleProf) {
		if (findByRef(scheduleProf.getRef()) != null) {
			return -1;
		} else {
			scheduleProfDao.save(scheduleProf);
			etudiantService.saveAll(scheduleProf, scheduleProf.getEtudiant());
			return 1;
		}
	}

	public List<SchdeduleVo> findSchedule() {
		List<ScheduleProf> sheduls = scheduleProfDao.findAll();
		List<SchdeduleVo> schdeduleVos = new ArrayList<SchdeduleVo>();
		for (ScheduleProf s : sheduls) {
			SchdeduleVo schdeduleVo = new SchdeduleVo();
			schdeduleVo.setId(s.getId());
			schdeduleVo.setTitle(s.getEtudiant().getNom());
			schdeduleVo.setStart(s.getStartTime());
			schdeduleVo.setEnd(s.getEndTime());
			schdeduleVo.setRef(s.getRef());
			schdeduleVo.setColor(s.getEtudiant().getEtatEtudiantSchedule().getCouleur());
			schdeduleVos.add(schdeduleVo);
		}
		return schdeduleVos;
	}

	public List<ScheduleProf> findAll() {
		return scheduleProfDao.findAll();
	}
	
public ScheduleProf update(ScheduleProf scheduleProf) {
	return scheduleProfDao.save(scheduleProf);
}



	@Autowired
	private ScheduleProfDao scheduleProfDao;
	@Autowired
	private EtudiantService etudiantService;
	@Autowired
	private EtatEtudiantScheduleService etatEtudiantScheduleService;
	@Autowired
	private ProfService profService;
}
