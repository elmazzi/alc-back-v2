package ma.learn.quiz.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.bean.Cours;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.Quiz;
import ma.learn.quiz.bean.RecommendTeacher;
import ma.learn.quiz.dao.RecommendTeacherDao;
import ma.learn.quiz.service.vo.RecommendTeacherVo;

@Service
public class RecommendTeacherService {

	
	@Autowired
	public RecommendTeacherDao recommendTeacherDao;
	@Autowired
	public RecommendTeacherService recommendTeacherService;
	@Autowired
	public ProfService profService;
	@Autowired 
	public EntityManager entityManager;
	@JsonFormat(pattern = "dd-MM-yyyy")
	Date dateRecommamdation = new Date();
	/*
	public RecommendTeacher findByRef(String ref) {
		return recommendTeacherDao.findByRef(ref);
	}
	*/
	 public List<RecommendTeacher> findByCriteria (RecommendTeacherVo recommendTeacherVo){
			String query = "SELECT e FROM RecommendTeacher e WHERE 1=1";
			if (recommendTeacherVo.getNom() != null  )
			{
				query += " AND  e.nom LIKE '%" + recommendTeacherVo.getNom()+"%'";
			}
			if (recommendTeacherVo.getPrenom() != null)
			{
				query+= "  AND  e.prenom LIKE '%" + recommendTeacherVo.getPrenom()+"'";
			}
			
			
			
			return  entityManager.createQuery(query).getResultList();	
		}
	 public void update(RecommendTeacher recommendTeacher){
		 recommendTeacherDao.save(recommendTeacher);
	    }

	public List<RecommendTeacher> findAll() {
		return recommendTeacherDao.findAll();
	}
	
	public int save(RecommendTeacher recommendTeacher ) {
		if(findRecommendTeacherById(recommendTeacher.getId())!=null) {
			return -1;
		}
		else {
			System.out.println("id::: " + recommendTeacher.getId());

			recommendTeacherDao.save(recommendTeacher);
			return 1;
		}
			
	}
	/*
	public int save(RecommendTeacher  recommendTeacher ) {
RecommendTeacher recommend =recommendTeacherDao.findRecommendTeacherByProfId(recommendTeacher.getProf().getId());
Prof prof = profService.findProfById(recommendTeacher.getProf().getId());
		if(recommend==null) {
			System.out.println(recommendTeacher);
			System.out.println(recommendTeacher.getProf().getId());
			RecommendTeacher recomm = new RecommendTeacher();
			recomm.setProf(prof);
			recomm.setNombrevote(recommendTeacher.getNombrevote()+1);
			recommendTeacherDao.save(recomm);
			return 4;
    
		}else {
			
			recommendTeacherService.update(recommendTeacher);
			return 1;
			}
		}
		*/
	/*
	public RecommendTeacher findByProfNom(String nom) {
		return recommendTeacherDao.findByProfNom(nom);
	}
	*/
	public Optional<RecommendTeacher> findById(Long id) {
		return recommendTeacherDao.findById(id);
	}
	/*
	
	public RecommendTeacher update(RecommendTeacher  recommendTeacher) {
		RecommendTeacher recommend =recommendTeacherDao.findRecommendTeacherByProfId(recommendTeacher.getProf().getId());
		System.out.println(recommendTeacher.getProf().getId());
		Prof prof = profService.findProfById(recommendTeacher.getProf().getId());
		recommend.setProf(prof);
		recommend.setNombrevote(recommend.getNombrevote()+1);
		return recommendTeacherDao.save(recommend);
	}
	
*/
	public RecommendTeacher findRecommendTeacherById(Long id) {
		return recommendTeacherDao.findRecommendTeacherById(id);
	}
	public List<RecommendTeacher> findRecommendTeacherByProfId(Long id) {
		return recommendTeacherDao.findRecommendTeacherByProfId(id);
	}	
	

}