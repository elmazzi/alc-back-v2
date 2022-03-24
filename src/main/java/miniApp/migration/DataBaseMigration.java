/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package miniApp.migration;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.*;
import ma.learn.quiz.service.TranslationEnAr;
import ma.learn.quiz.service.TypeHomeWorkService;
import miniApp.migration.constant.Constants;
import miniApp.migration.util.FileUtil;
import miniApp.migration.util.DownloaderUtil;
import miniApp.migration.util.JsoupUtil;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Id;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;

import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class DataBaseMigration {
    private String ref;
    private Cours cour;

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
    @Autowired
    private TypeDeQuestionDao typeDeQuestionDao;
    @Autowired
    private HomeWorkQuestionDao homeWorkQuestionDao;
    @Autowired
    private HomeWorkDao homeWorkDao;
    @Autowired
    private HomeWorkQSTReponseDao homeWorkQSTReponseDao;
    @Autowired
    private TranslationEnAr translationEnAr;
    @Autowired
    private DriveApiService driveApiService;
    @Autowired
    private TypeHomeWorkService typeHomeWorkService;


    public String htmlimagetext() throws Exception {
        File imageDirRoot = FileUtil.mkdire(Constants.root1, "images", true);
        File directoryPathParcous = new File(Constants.root);
        String[] parcour = directoryPathParcous.list();
        for (int i = 0; i < parcour.length; i++) {
            Centre centre = centreDao.findCentreByLibelle("American Center 1");
            if (centre != null) {
                Parcours parcours = parcoursDao.findByLibelle(parcour[i]);
                if (parcours == null) {
                    parcours = new Parcours();
                    parcours.setCentre(centre);
                    parcours.setLibelle(parcour[i]);
                    parcours.setCode(parcour[i]);
                    parcours = parcoursDao.save(parcours);
                }
                String pathParcoursImages = imageDirRoot.getAbsolutePath() + "\\" + parcour[i] + "\\";
                String pathParcours = Constants.root + parcour[i] + "\\";
                FileUtil.mkdire(pathParcoursImages, "Lesson", true);
                String pathLessonOrHomeWork = pathParcours + "Lesson";
                String pathHomwork = pathParcours + "HOMEWORK";
                String pathLessonOrHomeWorkImage = pathParcoursImages + "Lesson";
                String pathHomeWorkImage = pathParcoursImages + "HOMEWORK";
                File directoryPathSection = new File(pathLessonOrHomeWork);
                File directoryPathHomework = new File(pathHomwork);
                String[] section = directoryPathSection.list();
                String[] typeHomewrok = directoryPathHomework.list();


                for (int j = 0; j < section.length; j++) {
                    System.out.println("  sectionName ::::: " + "Lesson" + " " + parcour[i] + " " + section[j]);
                    String pathSection = pathLessonOrHomeWork + "\\" + section[j];
                    String pathSectionImage = pathLessonOrHomeWorkImage + "\\" + section[j];
                    if (new File(pathSection).exists()) {
                        FileUtil.mkdire(pathSectionImage, pathLessonOrHomeWorkImage, true);
                        System.out.println("pathSection ==> " + pathSection);
                        System.out.println("pathImage ==>" + pathSectionImage);
                        System.out.println("++++++++++++++++++++++++++++++");
                        extractHtmlImageAndContent(parcour[i], section[j], pathSection, pathSectionImage);
                    }
                }


                for (int j = 0; j < typeHomewrok.length; j++) {
                    String pathHomWork = pathHomwork + "\\" + typeHomewrok[j];
                    String pathHomWorkImage = pathHomeWorkImage + "\\" + typeHomewrok[j];
                    if (new File(pathHomWork).exists()) {
                        FileUtil.mkdire(pathHomeWorkImage, pathHomWorkImage, true);
                        System.out.println("++++++++++++++++++++++++++++++");
                        System.out.println("pathHomeWork ==> " + pathHomWork);

                        System.out.println("pathImage ==>" + pathHomWorkImage);
                        File homeWorkFile = new File(pathHomWork);
                        System.out.println(homeWorkFile.getName());
                        if (homeWorkFile.getName().equals("WATCH IT.txt")) {
                            System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                            System.out.println(homeWorkFile.getName());
                            this.getWatchItData(homeWorkFile, parcours);
                        } else {
                            extractHtmlImageAndContentForHomeWork(parcours.getId(), parcours.getLibelle(), typeHomewrok[j], pathHomWork, pathHomWorkImage);
                        }
                    }
                }
            }
        }
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        System.out.println("Finish Tnx For waiting");
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        return "process finish thanks for waiting";
    }

    private void getWatchItData(File file, Parcours parcours) {
        int index = 0;
        System.out.println(parcours.getId());
        List<Cours> coursList = this.coursDao.findByParcoursIdOrderByNumeroOrder(parcours.getId());
        try {
            System.out.println(Arrays.toString(file.list()));
            Scanner myReader = new Scanner(file);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                if (data.contains("https://www.youtube")) {
                    TypeDeQuestion typeDeQuestion = typeDeQuestionDao.findByLib("Watch and add new words");
                    if (typeDeQuestion == null) {
                        typeDeQuestion = this.saveTypeQstHomeWork("Watch and add new words");
                    }
                    for (Cours cour : coursList
                    ) {
                        if (cour.getNumeroOrder() == index) {
                            this.cour = cour;
                        }
                    }
                    HomeWork homeWork = homeWorkDao.findByLibelleAndCoursId("Watch it", this.cour.getId());
                    if (homeWork == null) {
                        homeWork = new HomeWork();
                        homeWork.setLibelle("Watch it");
                        homeWork.setCours(this.cour);
                        int firstindex = data.indexOf(" https");
                        String urlVideo = data.substring(firstindex);
                        homeWork.setUrlVideo(urlVideo);
                        System.out.println(urlVideo);
                        homeWork = homeWorkDao.save(homeWork);
                    }

                    index++;
                }
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }


    public void extractHtmlImageAndContentForHomeWork(Long parcourId, String parcours, String typeHomewrok, String pathHomWork, String pathHomWorkImage) {
        List<File> htmlFiles = FileUtil.findHtmlFiles(pathHomWork);
        htmlFiles.stream()
                .sorted((f1, f2) -> FileUtil.compare(f1, f2))
                .forEach(f -> {
                    try {


                        String imageSrc = JsoupUtil.getImageSrc(f);
                        String fileExtention = FileUtil.getExtension(imageSrc);
                        String imageNameDestination = gatImagePath(pathHomWork, pathHomWorkImage, f, imageSrc, fileExtention);


                        // -----------------------------------------   Home Work --------------------------------
                        String courLib = JsoupUtil.getElementContent(f, "span.js-lesson-type.link-dropdown_text-link");
                        Cours cours = coursDao.findCoursByLibelleAndParcoursId(courLib, parcourId);
                        HomeWork homeWork = homeWorkDao.findByLibelleAndCoursId(typeHomewrok, cours.getId());
                        if (homeWork == null) {
                            homeWork = new HomeWork();
                            homeWork = saveHomeWork(homeWork, typeHomewrok, cours);
                        }
                        // -----------------------------------------   Type de Question --------------------------------
                        String lib = JsoupUtil.getElementContent(f, "p.title-progress");
                        String lib1 = JsoupUtil.getElementContent(f, "p.title-list");
                        TypeDeQuestion typeDeQuestion;
                        System.out.println(lib1);
                        System.out.println(lib1.length());
                        System.out.println(lib);
                        System.out.println(lib.length());

                        if (lib.length() != 0) {
                            typeDeQuestion = typeDeQuestionDao.findByLib(lib);
                            if (typeDeQuestion == null) {
                                typeDeQuestion = this.saveTypeQstHomeWork(lib);
                            }

                            if (imageNameDestination.length() > 0) {
                                String imgName = parcours + cours.getLibelle() + typeHomewrok + FileUtil.fileNameWithOutExt(f.getName()) + "." + fileExtention;
                                String drivePath = this.addImgToGoogleDrive(parcours, cours.getLibelle(), typeHomewrok, imageNameDestination, imgName);
                                homeWork.setUrlImage(drivePath);
                                homeWork = homeWorkDao.save(homeWork);
                            }
                            System.out.println("====================File PATH =======================");
                            System.out.println(f.getName());


                            System.out.println("++++++++++++++++++++++ HOME WORK QUESTION  ++++++++++++++++++++++");
                            String homeWorkQstLibelle;
                            if (Objects.equals(typeDeQuestion.getLib(), "Write it up")) {
                                homeWorkQstLibelle = JsoupUtil.getElementContent(f, "p.text-task-write-it-up");
                            } else {
                                homeWorkQstLibelle = JsoupUtil.getElementContent(f, "div.wrapper-information > p");
                                this.ref = JsoupUtil.getElementContent(f, "p.title-information > strong");
                            }

                            System.out.println(homeWorkQstLibelle);
                            System.out.println(this.ref);

                            if (homeWorkQstLibelle.length() <= 0) {
                                return;
                            }
                            HomeWorkQuestion homeWorkQuestion = homeWorkQuestionDao.findHomeWorkQuestionByLibelleAndHomeWorkId(homeWorkQstLibelle, homeWork.getId());
                            if (homeWorkQuestion == null) {
                                homeWorkQuestion = saveHomeWorkQuestion(homeWork, typeDeQuestion, 1, homeWorkQstLibelle);
                            }


                        } else if (lib1.length() != 0) {
                            if (lib1.equals("Study the following phrases"))
                                lib1 = "Translate the phrase";
                            typeDeQuestion = typeDeQuestionDao.findByLib(lib1);
                            if (typeDeQuestion == null) {
                                typeDeQuestion = this.saveTypeQstHomeWork(lib1);
                            }
                            Elements elements = JsoupUtil.getElements(f, "div.word-list.is-open");
                            int index = 1;

                            for (Element element : elements
                            ) {
                                for (Element child : element.children()
                                ) {
                                    String homeWorkQstLibelle = child.select("p.word").text();
                                    if (homeWorkQstLibelle.length() <= 0) {
                                        return;
                                    }
                                    HomeWorkQuestion homeWorkQuestion = homeWorkQuestionDao.findHomeWorkQuestionByLibelleAndHomeWorkId(homeWorkQstLibelle, homeWork.getId());
                                    if (homeWorkQuestion == null) {
                                        homeWorkQuestion = saveHomeWorkQuestion(homeWork, typeDeQuestion, index, homeWorkQstLibelle);
                                    }
                                    HoweWorkQSTReponse homeWorkReponse = new HoweWorkQSTReponse();
                                    saveHomeWorkQstReponse(index, homeWorkQuestion, homeWorkReponse);
                                    index++;
                                }
                            }
                        }

                    } catch (Exception ex) {
                        Logger.getLogger(DataBaseMigration.class.getName()).log(Level.SEVERE, null, ex);
                    }
                });
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        System.out.println("Finish Tnx For waiting");
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    }

    private String addImgToGoogleDrive(String parcours, String libelle, String typeHomewrok, String imageNameDestination, String imgName) throws Exception {
        return this.driveApiService.createFile(parcours, libelle, typeHomewrok, imageNameDestination, imgName);
    }

    private String gatImagePath(String pathHomWork, String pathHomWorkImage, File f, String imageSrc, String fileExtention) throws IOException {

        String imageNameSource;
        if (!imageSrc.startsWith("https")) {
            imageNameSource = pathHomWork + "\\" + imageSrc;
        } else {
            String tmpFolderForDownladedImage = pathHomWork + "\\tmp\\" + FileUtil.fileNameWithOutExt(f.getName()) + "." + fileExtention;
            System.out.println("4444444444 DOWNLOADING tmpFolderForDownladedImage ==>>>" + tmpFolderForDownladedImage);
            FileUtil.mkdire(pathHomWork, "tmp", true);
            DownloaderUtil.exec(imageSrc, tmpFolderForDownladedImage, fileExtention);
            imageNameSource = tmpFolderForDownladedImage;
        }

        final String imageNameDestination = pathHomWorkImage + "\\" + FileUtil.fileNameWithOutExt(f.getName()) + "." + fileExtention;
        System.out.println("imageNameSource = " + imageNameSource + " && imageNameDestination " + imageNameDestination);
        return imageNameSource;
    }


    private void saveHomeWorkQstReponse(int index, HomeWorkQuestion homeWorkQuestion, HoweWorkQSTReponse homeWorkReponse) throws IOException {
        homeWorkReponse.setEtatReponse("true");
        homeWorkReponse.setHomeWorkQuestion(homeWorkQuestion);
        homeWorkReponse.setLib(this.translate(homeWorkQuestion.getLibelle()));
        homeWorkReponse.setNumero(index);
        homeWorkReponse = homeWorkQSTReponseDao.save(homeWorkReponse);
    }

    private HomeWorkQuestion saveHomeWorkQuestion(HomeWork homeWork, TypeDeQuestion typeDeQuestion, int index, String homeWorkQstLibelle) {
        HomeWorkQuestion homeWorkQuestion = new HomeWorkQuestion();
        if (Objects.equals(typeDeQuestion.getLib(), "Read and add new words")) {
            homeWorkQuestion.setRef(this.ref);
        }
        homeWorkQuestion.setTypeDeQuestion(typeDeQuestion);
        homeWorkQuestion.setLibelle(homeWorkQstLibelle);
        homeWorkQuestion.setPointReponseJuste(1);
        homeWorkQuestion.setPointReponsefausse(0);
        homeWorkQuestion.setHomeWork(homeWork);
        homeWorkQuestion.setNumero(index);
        System.out.println("**************************************");
        System.out.println(homeWorkQuestion.getLibelle());
        homeWorkQuestion = homeWorkQuestionDao.save(homeWorkQuestion);
        return homeWorkQuestion;
    }

    private HomeWork saveHomeWork(HomeWork homeWork, String typeHomewrok, Cours cours) {
        homeWork.setLibelle(typeHomewrok);
        homeWork.setCours(cours);
        TypeHomeWork t = this.typeHomeWorkService.findByLibelle(typeHomewrok);
        homeWork.setTypeHomeWork(t);
        homeWork = homeWorkDao.save(homeWork);
        return homeWork;
    }

    public TypeDeQuestion saveTypeQstHomeWork(String lib) {
        TypeDeQuestion t1 = new TypeDeQuestion();
        t1.setLib(lib);
        List<TypeDeQuestion> questionList = typeDeQuestionDao.findAll();
        int ref = questionList.size() + 1;
        t1.setRef("t" + ref);
        t1 = typeDeQuestionDao.save(t1);
        return t1;
    }

    public String translate(String word) throws IOException {
        System.out.println(word);
        String text = this.translationEnAr.TranslationResult(word);
        System.out.println("//////////////////////////////////////////");
        System.out.println(text);
        return text;
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
                            SuperCategorieSection superCategorieSection = superCategorieSectionDao.findSuperCategorieSectionByLibelle(JsoupUtil.getElementContent(f, "p.lessons-list_title-additional-list"));
                            CategorieSection categorieSection1 = categorieSectionDoa.findCategorieSectionByLibelle(categorieSection);
                            if (superCategorieSection == null) {
                                superCategorieSection = initSuperCategorie(f);
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
                                if (Objects.equals(cours.getLibelle(), "Intro lesson")) {
                                    cours.setNumeroOrder(0);
                                } else {
                                    String myTxt = cours.getLibelle().substring(0, 2).replaceAll("\\s", "");
                                    cours.setNumeroOrder(Integer.parseInt(myTxt));
                                }
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
                                section.setNumeroOrder(categorieSection1.getNumeroOrder());
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
                            System.out.println(parcours.getLibelle());
                            System.out.println("Lesson");
                            System.out.println(section.getCategorieSection().getLibelle());
                            FileUtil.copyFile(imageNameSource, imageNameDestination);
                            String imgName = parcours.getLibelle() + cours.getLibelle() + section.getCategorieSection().getLibelle() + FileUtil.fileNameWithOutExt(f.getName()) + "." + fileExtention;

                            String drivePath = this.addImgToGoogleDrive(parcours.getLibelle(), cours.getLibelle(), section.getCategorieSection().getLibelle(), imageNameDestination, imgName);
                            System.out.println("_______________________________________________________________________");
                            System.out.println(drivePath);
                            section.setUrlImage(drivePath);
                            sectionDao.save(section);
                            System.out.println("_______________________________________________________________________");
                        }


                    } catch (Exception ex) {
                        Logger.getLogger(DataBaseMigration.class.getName()).log(Level.SEVERE, null, ex);
                    }
                });
    }

    private SuperCategorieSection initSuperCategorie(File f) throws IOException {
        SuperCategorieSection superCategorieSection;
        superCategorieSection = new SuperCategorieSection();
        superCategorieSection.setCode(JsoupUtil.getElementContent(f, "p.lessons-list_title-additional-list"));
        superCategorieSection.setLibelle(JsoupUtil.getElementContent(f, "p.lessons-list_title-additional-list"));
        superCategorieSectionDao.save(superCategorieSection);
        return superCategorieSection;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Id
    public Long getId() {
        return id;
    }


}
