package ma.learn.quiz.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ma.learn.quiz.bean.CalendrierProf;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.dao.CalendrierProfDao;
import ma.learn.quiz.vo.CalendrierVo;

@Service
public class CalendrierProfService {
	@Transactional
	public int deleteCalendrierProfById(Long id) {
		return calendrierProfDao.deleteCalendrierProfById(id);
	}

	
	public List<CalendrierProf> findByProfId(Long id) {
		return calendrierProfDao.findByProfId(id);
	}


	public CalendrierProf update(CalendrierProf calendrierProf) {
		CalendrierProf calendrier = calendrierProfDao.findCalendrierProfById(calendrierProf.getId());
		calendrier.setStartRecur(calendrierProf.getStartRecur());
		calendrier.setEndRecur(calendrierProf.getEndRecur());
		return calendrierProfDao.save(calendrier);
	}

	public CalendrierProf findByRef(String ref) {
		return calendrierProfDao.findByRef(ref);
	}

	@Transactional
	public int deleteByRef(String ref) {
		return calendrierProfDao.deleteByRef(ref);
	}

	public int save(CalendrierProf calendrierProf) {
		if (findByRef(calendrierProf.getRef()) != null) {
			return -1;
		} else {
			calendrierProfDao.save(calendrierProf);
			return 1;
		}
	}

	public List<CalendrierVo> findScheduleEtudiant(long id) {
		List<CalendrierProf> sheduls = calendrierProfDao.findByEtudiantId(id);
		List<CalendrierVo> calendrierVos = new ArrayList<CalendrierVo>();
		for (CalendrierProf s : sheduls) {
			CalendrierVo calendrierVo = new CalendrierVo();
			calendrierVo.setId(s.getId());
			calendrierVo.setTitle(s.getEtudiant().getNom());
			calendrierVo.setStartRecur(s.getStartRecur());
			calendrierVo.setEndRecur(s.getEndRecur());
			calendrierVo.setStartTime(s.getStartTime());
			calendrierVo.setEndTime(s.getEndTime());
			calendrierVo.setTitleProf(s.getProf().getNom());
			calendrierVo.setColor(s.getEtudiant().getEtatEtudiantSchedule().getCouleur());
			calendrierVos.add(calendrierVo);
		}
		return calendrierVos;
	}
	public List<CalendrierVo> findSchedule(long id) {
		List<CalendrierProf> sheduls = calendrierProfDao.findByProfId(id);
		List<CalendrierVo> calendrierVos = new ArrayList<CalendrierVo>();
		for (CalendrierProf s : sheduls) {
			CalendrierVo calendrierVo = new CalendrierVo();
			calendrierVo.setId(s.getId());
			calendrierVo.setTitle(s.getEtudiant().getNom());
			calendrierVo.setStartRecur(s.getStartRecur());
			calendrierVo.setEndRecur(s.getEndRecur());
			calendrierVo.setStartTime(s.getStartTime());
			calendrierVo.setEndTime(s.getEndTime());
			calendrierVo.setColor(s.getEtudiant().getEtatEtudiantSchedule().getCouleur());
			calendrierVos.add(calendrierVo);
		}
		return calendrierVos;
	}

	public List<CalendrierVo> findAllSchedule() {
		List<CalendrierProf> sheduls = calendrierProfDao.findAll();
		List<CalendrierVo> calendrierVos = new ArrayList<>();
		for (CalendrierProf s : sheduls) {
			CalendrierVo calendrierVo = new CalendrierVo();
			calendrierVo.setId(s.getId());
			calendrierVo.setTitle(s.getEtudiant().getNom());
			calendrierVo.setStartRecur(s.getStartRecur());
			calendrierVo.setEndRecur(s.getEndRecur());
			calendrierVo.setStartTime(s.getStartTime());
			calendrierVo.setEndTime(s.getEndTime());
			calendrierVo.setTitleProf(s.getProf().getNom());
			calendrierVo.setColor("yellow");
			calendrierVos.add(calendrierVo);
		}
		return calendrierVos;
	}
	public List<CalendrierProf> findAll() {
		return calendrierProfDao.findAll();
	}

	public List<CalendrierProf> findByEtudiantId(Long id) {
		return calendrierProfDao.findByEtudiantId(id);
	}

	@Autowired
	private CalendrierProfDao calendrierProfDao;
	@Autowired
	private ProfService profService;
}
