package ma.learn.quiz.service;



import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.learn.quiz.bean.CategorieSection;
import ma.learn.quiz.bean.Cours;
import ma.learn.quiz.bean.Inscription;
import ma.learn.quiz.bean.Parcours;
import ma.learn.quiz.bean.Section;
import ma.learn.quiz.bean.SectionItem;
import ma.learn.quiz.dao.SectionDao;
import ma.learn.quiz.dao.VocabularyDao;

@Service
public class SectionService {

    @Autowired
    public ParcoursService parcoursService;
    @Autowired
    public SectionDao sectionDao;
    @Autowired
    public CoursService coursService;
    @Autowired
    public CategorieSectionService categorieSectionService;
    @Autowired
    public EntityManager entityManager;
    @Autowired
    private VocabularyService vocabularyService;

    public Section findByCoursIdAndCategorieSectionLibelle(Long id, String libelle) {
        return sectionDao.findByCoursIdAndCategorieSectionLibelle(id, libelle);
    }


    public int deleteByCours(Cours cours) {
        return sectionDao.deleteByCours(cours);
    }


    public Section findByCoursIdAndNumeroOrder(Long id, int numeroOrder) {
        return sectionDao.findByCoursIdAndNumeroOrder(id, numeroOrder);
    }


    public List<Section> findByCours(Cours cours) {
        return sectionDao.findByCours(cours);
    }


    public List<Section> findByLibelle(String libelle) {
        return sectionDao.findByLibelle(libelle);
    }


    public List<Section> findByCategorieSectionLibelle(String libelle) {
        return sectionDao.findByCategorieSectionLibelle(libelle);
    }

    @Transactional
    public int deleteSectionById(List<Section> sections) {
        int res = 0;
        for (int i = 0; i < sections.size(); i++) {
            res += deleteSectionById(sections.get(i).getId());
        }
        return res;
    }


    @Transactional
    public int deleteByCoursCode(String code) {
        return sectionDao.deleteByCoursCode(code);
    }


    public List<Section> findByCoursCode(String code) {
        return sectionDao.findByCoursCode(code);
    }


    public List<Section> findByCoursId(Long id) {
        return sectionDao.findByCoursId(id);
    }

    public List<Section> findByCriteria(Long id) {
        String query = "SELECT e FROM Section e WHERE e.cours.id='" + id + "'ORDER BY e.numeroOrder ASC";
        return entityManager.createQuery(query).getResultList();
    }


    public List<Section> findByCategorieSectionCode(String code) {
        return sectionDao.findByCategorieSectionCode(code);
    }

    public int deleteByCategorieSectionCode(String code) {
        return sectionDao.deleteByCategorieSectionCode(code);
    }

    public Section findByCode(String code) {
        return sectionDao.findByCode(code);
    }


    public int create(Section section) {
        sectionDao.save(section);

        return 1;
    }


    public int save(Section section) {
        Cours cours = coursService.findCoursById(section.getCours().getId());
        if (cours == null) return -1;
        CategorieSection categorieSection = categorieSectionService.findByCode(section.getCategorieSection().getCode());
        if (categorieSection == null) return -2;
        else {
            section.setCategorieSection(categorieSection);
            section.setCours(cours);
            sectionDao.save(section);

            return 1;
        }
    }


    public List<Section> findAll() {
        return sectionDao.findAll();
    }

    public void transformurl() {
        List<Section> sections = findAll();
        int total = 0;
        int sum = 0;
        for (Section s : sections) {
            total++;
            System.out.println(s.toString());
            if (s.getUrlImage() != null) {
                if (!(s.getUrlImage().equals("")) || !(s.getUrlImage().isEmpty())) {
                    if (s.getUrlImage().startsWith("https://drive.google.com/file/d/")) {
                        String initialString = s.getUrlImage();
                        String stringExcerpt = "https://drive.google.com/uc?export=view&id=" + initialString.substring(32, 65);
                        s.setUrlImage(stringExcerpt);
                        sectionDao.save(s);
                        sum++;
                    }
                    /*if (!s.getUrlImage().startsWith("https://drive.google.com/file/d/") && !s.getUrlImage().startsWith("https://drive.google.com/uc?export=view&id=")) {
                        s.setUrlImage(null);
                        sectionDao.save(s);
                    }*/
                }
            }
        }
        System.out.println("tot sections = " + total + "et sum est " + sum);
    }

    public void transformurlvideo() {
        List<Section> sections = findAll();
        int total = 0;
        int sum = 0;
        for (Section s : sections) {
            total++;
            System.out.println(s.toString());
            if (s.getUrlVideo() != null) {
                if (!(s.getUrlVideo().equals("")) || !(s.getUrlVideo().isEmpty())) {
                    if (s.getUrlVideo().startsWith("https://www.youtube.com/watch")) {
                        String initialString = s.getUrlVideo();
                        String stringExcerpt = "https://www.youtube.com/embed/" + initialString.substring(32, 43);
                        s.setUrlVideo(stringExcerpt);
                        sectionDao.save(s);
                        sum++;
                    }
                   /* if (!s.getUrlVideo().startsWith("https://www.youtube.com/watch") && !s.getUrlVideo().startsWith("https://www.youtube.com/embed/")) {
                        s.setUrlVideo(null);
                        sectionDao.save(s);
                    }*/
                }
            }
        }
    }


    public Section update(Section section) {

        Optional<Section> sections = sectionDao.findById(section.getId());
        Section LoadedSection = sections.get();
        Cours cours = coursService.findCoursById(section.getCours().getId());
        LoadedSection.setCours(cours);
        CategorieSection categorieSection = categorieSectionService.findCategorieSectionById(section.getCategorieSection().getId());
        LoadedSection.setCategorieSection(categorieSection);
        LoadedSection.setLibelle(section.getLibelle());
        LoadedSection.setContenu(section.getContenu());
        LoadedSection.setIndicationProf(section.getIndicationProf());
        LoadedSection.setQuestions(section.getQuestions());
        LoadedSection.setNumeroOrder(section.getNumeroOrder());
        LoadedSection.setQuestions(section.getQuestions());
        LoadedSection.setUrlVideo(section.getUrlVideo());
        LoadedSection.setUrlImage(section.getUrlImage());
        LoadedSection.setUrlImage2(section.getUrlImage2());
        LoadedSection.setUrlImage3(section.getUrlImage3());
        LoadedSection.setCode(section.getCode());
        if (section.getUrlImage() != null || section.getUrlVideo() != null) {
            LoadedSection.setUrl(1);
        }
        if (section.getContenu() != null) {
            LoadedSection.setContent(1);
        }
        coursService.update(section.getCours());
        return sectionDao.save(LoadedSection);

    }


    public int deleteByCoursId(Long id) {
        return sectionDao.deleteByCoursId(id);
    }


    @Transactional
    public int deleteSectionById(Long id) {
        int res2 = vocabularyService.deleteBySectionId(id);
        int res = sectionDao.deleteSectionById(id);
        return res2 + res;
    }


    public Section findSectionById(Long id) {
        return sectionDao.findSectionById(id);
    }


    public Section findSectionByCours(Cours cours) {
        return sectionDao.findSectionByCours(cours);
    }


    public Section findSectionByCoursAndCategorieSection(Cours cours, CategorieSection categorieSection) {
        return sectionDao.findSectionByCoursAndCategorieSection(cours, categorieSection);
    }

	public int setSectionItems(Long idSection, List<SectionItem> sectionItems) {
		Section section = findSectionById(idSection);

		if (section == null) {
			return -1;
		} else {
			if (sectionItems == null || sectionItems.isEmpty()) {
				return -2;
			} else {
                for (SectionItem item : sectionItems) {
                    item.setSection(section);
                }
				section.setSectionItems(sectionItems);
                sectionDao.save(section);
				return 1;
			}
		}
	}


}

	

