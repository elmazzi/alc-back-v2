/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package miniApp.migration;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.*;
import miniApp.migration.constant.Constants;
import miniApp.migration.util.FileUtil;
import miniApp.migration.util.DownloaderUtil;
import miniApp.migration.util.FileUtil;
import miniApp.migration.util.JsoupUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class DataBaseMigration {
    public DataBaseMigration() {
    }

    @Autowired
    private ParcoursDao parcoursDao;
    @Autowired
    private CoursDao coursDao;
    @Autowired
    private SectionDao sectionDao;
    @Autowired
    private CentreDao centreDao;
    @Autowired
    private CategorieSectionDao categorieSectionDoa;
    @Autowired
    private SuperCategorieSectionDao superCategorieSectionDao;
    private Long id;

    public void htmlimagetext() {
        File imageDirRoot = FileUtil.mkdire(Constants.root1, "images", true);
        File directoryPath=new File(Constants.root);
        String[] contents = directoryPath.list();
        for(int i=0; i<contents.length; i++) {
            Centre centre = centreDao.findCentreByLibelle("American Center 1");
            if (centre != null) {
                Parcours parcours = parcoursDao.findByLibelle(contents[i]);
                if (parcours == null) {
                    parcours = new Parcours();
                    parcours.setCentre(centre);
                    parcours.setLibelle(contents[i]);
                    parcours.setCode(contents[i]);
                    parcoursDao.save(parcours);
                }
                String pathParcoursImages = imageDirRoot.getAbsolutePath() + "\\" + contents[i] + "\\";
                String pathParcours = Constants.root + contents[i] + "\\";
                for (String lessonOrHomeWorkOfParkour : Constants.lessonOrHomeWorkOfParkours) {
                    FileUtil.mkdire(pathParcoursImages, lessonOrHomeWorkOfParkour, true);
                    String pathLessonOrHomeWork = pathParcours + lessonOrHomeWorkOfParkour;
                    String pathLessonOrHomeWorkImage = pathParcoursImages + lessonOrHomeWorkOfParkour;
                    for (String sectionName : Constants.sectionNames) {
                        System.out.println("  sectionName ::::: " + lessonOrHomeWorkOfParkour + " " + contents[i] + " " + sectionName);
                        String pathSection = pathLessonOrHomeWork + "\\" + sectionName;
                        String pathSectionImage = pathLessonOrHomeWorkImage + "\\" + sectionName;
                        if (new File(pathSection).exists()) {
                            FileUtil.mkdire(pathSectionImage, pathLessonOrHomeWorkImage, true);
                            System.out.println("pathSection ==> " + pathSection);
                            System.out.println("pathImage ==>" + pathSectionImage);
                            System.out.println("++++++++++++++++++++++++++++++");
                            extractHtmlImageAndContent(contents[i], sectionName, pathSection, pathSectionImage);
                        }
                    }
                }
            }
        }
/*
        for (String parcour : Constants.parcours) {
            Centre centre = centreDao.findCentreByLibelle("American Center 1");
            if (centre != null) {
                Parcours parcours = parcoursDao.findByLibelle(parcour);
                if (parcours == null) {
                    parcours = new Parcours();
                    parcours.setCentre(centre);
                    parcours.setLibelle(parcour);
                    parcours.setCode(parcour);
                    parcoursDao.save(parcours);
                }
                String pathParcoursImages = imageDirRoot.getAbsolutePath() + "\\" + parcour + "\\";
                String pathParcours = Constants.root + parcour + "\\";
                for (String lessonOrHomeWorkOfParkour : Constants.lessonOrHomeWorkOfParkours) {
                    FileUtil.mkdire(pathParcoursImages, lessonOrHomeWorkOfParkour, true);
                    String pathLessonOrHomeWork = pathParcours + lessonOrHomeWorkOfParkour;
                    String pathLessonOrHomeWorkImage = pathParcoursImages + lessonOrHomeWorkOfParkour;
                    for (String sectionName : Constants.sectionNames) {
                        System.out.println("  sectionName ::::: " + lessonOrHomeWorkOfParkour + " " + parcour + " " + sectionName);
                        String pathSection = pathLessonOrHomeWork + "\\" + sectionName;
                        String pathSectionImage = pathLessonOrHomeWorkImage + "\\" + sectionName;
                        if (new File(pathSection).exists()) {
                            FileUtil.mkdire(pathSectionImage, pathLessonOrHomeWorkImage, true);
                            System.out.println("pathSection ==> " + pathSection);
                            System.out.println("pathImage ==>" + pathSectionImage);
                            System.out.println("++++++++++++++++++++++++++++++");
                            extractHtmlImageAndContent(parcour, sectionName, pathSection, pathSectionImage);
                        }
                    }
                }
            }
        }
*/
    }


    public void extractHtmlImageAndContent(String nameparcours, String categorieSection, String directoryName, String imagePath) {
        List<File> htmlFiles = FileUtil.findHtmlFiles(directoryName);

        htmlFiles.stream()
                .sorted((f1, f2) -> FileUtil.compare(f1, f2))
                .forEach(f -> {
                    try {
                        Parcours parcours = parcoursDao.findByLibelle(nameparcours);
                        if (parcours != null) {
                            String imageSrc = JsoupUtil.getImageSrc(f);
                            String fileExtention = FileUtil.getExtension(imageSrc);
                          /*  System.out.println("file = " + f.getName() + " ==> ");
                            System.out.println("content ==> " + JsoupUtil.getElementContentByClass(f, "div.wrapper-information"));
                            System.out.println("Lesson >Title  ==> " + JsoupUtil.getElementContent(f, "div.link-dropdown_link-dropdown"));
                            System.out.println("Lesson > Section title  ==> " + JsoupUtil.getElementContent(f, "p.title-progress"));
                            System.out.println("Lesson > Section  content  ==> " + JsoupUtil.getElementContentLesson(f, "div.wrapper-information"));
                            System.out.println("Home work  ==> " + JsoupUtil.getElementContent(f, "p.text-task-write-it-up"));
                            System.out.println("img ==> " + directoryName + "\\" + imageSrc);*/
                            SuperCategorieSection superCategorieSection = superCategorieSectionDao.findSuperCategorieSectionByLibelle(JsoupUtil.getElementContent(f, "p.lessons-list_title-additional-list"));
                            CategorieSection categorieSection1 = categorieSectionDoa.findCategorieSectionByLibelle(categorieSection);
                            if (superCategorieSection == null) {
                                superCategorieSection = new SuperCategorieSection();
                                superCategorieSection.setCode(JsoupUtil.getElementContent(f, "p.lessons-list_title-additional-list"));
                                superCategorieSection.setLibelle(JsoupUtil.getElementContent(f, "p.lessons-list_title-additional-list"));
                                superCategorieSectionDao.save(superCategorieSection);
                            }

                            if (categorieSection1 == null) {
                                categorieSection1 = new CategorieSection();
                                categorieSection1.setLibelle(categorieSection);
                                categorieSection1.setCode(JsoupUtil.getElementContent(f, "p.title-progress"));
                                categorieSection1.setSuperCategorieSection(superCategorieSection);
                                categorieSectionDoa.save(categorieSection1);
                            } else {
                                categorieSection1.setSuperCategorieSection(superCategorieSection);
                                categorieSection1.setCode(JsoupUtil.getElementContent(f, "p.lessons-list_title-additional-list"));
                                categorieSectionDoa.save(categorieSection1);
                            }
                            Cours cours = coursDao.findCoursByLibelleAndParcoursId(JsoupUtil.getElementContent(f, "div.link-dropdown_link-dropdown"), parcours.getId());
                            if (cours == null) {
                                cours = new Cours();
                                cours.setParcours(parcours);
                                cours.setLibelle(JsoupUtil.getElementContent(f, "div.link-dropdown_link-dropdown"));
                                coursDao.save(cours);
                                parcours.setNombreCours(parcours.getNombreCours() + 1);
                                parcoursDao.save(parcours);
                            }
                                Section section = sectionDao.findSectionByLibelleAndCoursId(JsoupUtil.getElementContent(f, "p.title-progress"), cours.getId());
                                if (section == null) {
                                    section = new Section();
                                    section.setLibelle(JsoupUtil.getElementContent(f, "p.title-progress"));
                                    section.setCategorieSection(categorieSection1);
                                    section.setCode(JsoupUtil.getElementContent(f, "p.title-progress"));
                                    section.setContenu(JsoupUtil.getElementContentLesson(f, "div.wrapper-information"));
                                    section.setCours(cours);
                                    sectionDao.save(section);
                                }


                            String imageNameSource = null;
                            if (!imageSrc.startsWith("https")) {
                                imageNameSource = directoryName + "\\" + imageSrc;
                            } else {
                                String tmpFolderForDownladedImage = directoryName + "\\tmp\\" + FileUtil.fileNameWithOutExt(f.getName()) + "." + fileExtention;
                                System.out.println("4444444444 DOWNLOADING tmpFolderForDownladedImage ==>>>" + tmpFolderForDownladedImage);
                                FileUtil.mkdire(directoryName, "tmp", true);
                                DownloaderUtil.exec(imageSrc, tmpFolderForDownladedImage, fileExtention);
                                imageNameSource = tmpFolderForDownladedImage;
                            }
                            final String imageNameDestination = imagePath + "\\" + FileUtil.fileNameWithOutExt(f.getName()) + "." + fileExtention;
                            System.out.println("imageNameSource = " + imageNameSource + " && imageNameDestination " + imageNameDestination);
                            FileUtil.copyFile(imageNameSource, imageNameDestination);
                            System.out.println("***********************************\n");
                        }


                    } catch (IOException ex) {
                        Logger.getLogger(DataBaseMigration.class.getName()).log(Level.SEVERE, null, ex);
                    }
                });
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Id
    public Long getId() {
        return id;
    }
}
