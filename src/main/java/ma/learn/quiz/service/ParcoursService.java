package ma.learn.quiz.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ma.learn.quiz.bean.Centre;
import ma.learn.quiz.bean.Cours;
import ma.learn.quiz.bean.Parcours;
import ma.learn.quiz.bean.Section;
import ma.learn.quiz.dao.ParcoursDao;

@Service
public class ParcoursService {
	@Autowired
    private EtudiantService etudiantService; 
    @Autowired
    private ParcoursDao parcoursDao;
    @Autowired
    private CoursService coursService;
    @Autowired
    private SectionService sectionService;
    @Autowired
    private CentreService centreService;
    

	public Parcours findParcoursById(Long id) {
		return parcoursDao.findParcoursById(id);
	}


	public Parcours findByCode(String code) {
		return parcoursDao.findByCode(code);
	}
	

	public List<Parcours> findByLibelle(String libelle) {
		return parcoursDao.findByLibelle(libelle);
	}
	@Transactional
	public int deleteParcoursById(List<Parcours> parcourss) {
		int res=0;
        for (int i = 0; i < parcourss.size(); i++) {
            res+=deleteParcoursById(parcourss.get(i).getId());
        }
        return res;
	}
	

	@Transactional
	public int deleteParcoursById(Long id) {
		int deleteByEtudiantID= etudiantService.deleteByParcoursId(id);
		List<Cours> cours = coursService.findByParcoursId(id);
        for (Cours c:cours) {
            List<Section> sections = sectionService.findByCours(c);
            int sectionDeleted=0;
            for (Section section: sections) {

                sectionDeleted+= sectionService.deleteByCours(c);
            }}
		int deleteByCoursID=coursService.deleteByParcoursId(id);
		int deleteByID=parcoursDao.deleteParcoursById(id);
		return deleteByEtudiantID+deleteByCoursID+deleteByID;
	}

	
	public Parcours findParcoursByLibelle(String libelle) {
		return parcoursDao.findParcoursByLibelle(libelle);
	}


	public void save(Parcours parcours) {
		
		create(parcours);
			for(int i=0;i<parcours.getNombreCours();i++) {
				Cours cours= new Cours();
				cours.setParcours(parcours);
				coursService.create(cours);
			}
		
		
	}

	 public int create(Parcours  parcours ) {
		 Centre centre=centreService.findByRef(parcours.getCentre().getRef());

			if(centre == null) {
				return -1;
			} else {
				parcours.setCentre(centre);
		        parcoursDao.save(parcours);
				return 1;
			}

	 }

	public List<Parcours> findByCentreRef(String ref) {
		return parcoursDao.findByCentreRef(ref);
	}

	public int deleteByCentreRef(String Ref) {
		return parcoursDao.deleteByCentreRef(Ref);
	}

	public List<Parcours> findAll() {
		return parcoursDao.findAll();
	}

	public void delete(Parcours entity) {
		parcoursDao.delete(entity);
	}
	
	 
	public Parcours update(Parcours parcours) {
		List<Cours> cours = coursService.findByParcoursId(parcours.getId());
		int nbCours = 0;
        for (Cours c:cours) {
        	if(c.getId() !=null) {
        	nbCours++;}
           
        }
        	parcours.setNombreCours(nbCours);
		 Centre centre=centreService.findByRef(parcours.getCentre().getRef());
		parcours.setCentre(centre);
		parcours.setLibelle(parcours.getLibelle());
		parcours.setDateCreation(parcours.getDateCreation());
		parcours.setDescription(parcours.getDescription());
		parcours.setDatePublication(parcours.getDatePublication());
		parcours.setCourses(parcours.getCourses());
		return parcoursDao.save(parcours);
		
	}
	
   
}
