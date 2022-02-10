/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package miniApp.migration;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.FileList;
import com.google.api.services.drive.model.Permission;
import ma.learn.quiz.bean.*;
import ma.learn.quiz.dao.*;
import ma.learn.quiz.service.TranslationEnAr;
import miniApp.migration.constant.Constants;
import miniApp.migration.util.FileUtil;
import miniApp.migration.util.DownloaderUtil;
import miniApp.migration.util.JsoupUtil;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import javax.persistence.Id;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

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


    public void htmlimagetext() throws Exception {
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

                for (int j = 0; j < typeHomewrok.length; j++) {
                    String pathHomWork = pathHomwork + "\\" + typeHomewrok[j];
                    String pathHomWorkImage = pathHomeWorkImage + "\\" + typeHomewrok[j];
                    if (new File(pathHomWork).exists()) {
                        FileUtil.mkdire(pathHomeWorkImage, pathHomWorkImage, true);
                        System.out.println("++++++++++++++++++++++++++++++");
                        System.out.println("pathSection ==> " + pathHomWork);
                        System.out.println("pathImage ==>" + pathHomWorkImage);
                        extractHtmlImageAndContentForHomeWork(parcours.getId(), typeHomewrok[j], pathHomWork, pathHomWorkImage);
                    }

                }

                for (int j = 0; j < section.length; j++) {
                    System.out.println("  sectionName ::::: " + "Lesson" + " " + parcour[i] + " " + section[j]);
                    String pathSection = pathLessonOrHomeWork + "\\" + section[j];
                    String pathSectionImage = pathLessonOrHomeWorkImage + "\\" + section[j];
                    if (new File(pathSection).exists()) {
                        FileUtil.mkdire(pathSectionImage, pathLessonOrHomeWorkImage, true);
                        System.out.println("pathSection ==> " + pathSection);
                        System.out.println("pathImage ==>" + pathSectionImage);
                        System.out.println("++++++++++++++++++++++++++++++");
//                        extractHtmlImageAndContent(parcour[i], section[j], pathSection, pathSectionImage);
                    }
                }
            }
        }

    }


    public void extractHtmlImageAndContentForHomeWork(Long parcourId, String typeHomewrok, String pathHomWork, String pathHomWorkImage) {
        List<File> htmlFiles = FileUtil.findHtmlFiles(pathHomWork);
        htmlFiles.stream()
                .sorted((f1, f2) -> FileUtil.compare(f1, f2))
                .forEach(f -> {
                    try {
                        // -----------------------------------------   Home Work --------------------------------
                        String courLib = JsoupUtil.getElementContent(f, "span.js-lesson-type.link-dropdown_text-link");
                        Cours cours = coursDao.findCoursByLibelleAndParcoursId(courLib, parcourId);
                        HomeWork homeWork = homeWorkDao.findByLibelle(typeHomewrok);
                        if (homeWork == null) {
                            homeWork = new HomeWork();
                            homeWork.setLibelle(typeHomewrok);
                            homeWork.setCours(cours);
                            homeWork = homeWorkDao.save(homeWork);
                        }

                        // -----------------------------------------   Type de Question --------------------------------
                        String lib = JsoupUtil.getElementContent(f, "p.title-progress");
                        String lib1 = JsoupUtil.getElementContent(f, "p.title-list");
                        TypeDeQuestion typeDeQuestion;

                        System.out.println("+++++++++++++++++++++++++++++++++++++++");
                        System.out.println(lib1);
                        System.out.println(lib1.length());
                        System.out.println("===========================================");
                        System.out.println(lib);
                        System.out.println(lib.length());

                        if (lib.length() != 0) {
                            typeDeQuestion = typeDeQuestionDao.findByLib(lib);
                            if (typeDeQuestion == null) {
                                typeDeQuestion = this.isTypeQstExist(lib);
                            }
                        } else if (lib1.length() != 0) {
                            if (lib1.equals("Study the following phrases"))
                                lib1 = "Translate the phrase";
                            typeDeQuestion = typeDeQuestionDao.findByLib(lib1);
                            if (typeDeQuestion == null) {
                                typeDeQuestion = this.isTypeQstExist(lib1);
                            }
                            Elements elements = JsoupUtil.getElements(f, "div.word-list.is-open");


                            for (Element element : elements
                            ) {
                                for (Element child : element.children()
                                ) {
                                    System.out.println("======================++++++==========================");
                                    System.out.println(child.text());
                                    System.out.println("======================+++++++++++==========================");

                                    String homeWorkQstLibelle = child.select("p.word").text();
                                    System.out.println("----------------------------------------");
                                    System.out.println(homeWorkQstLibelle);
                                    HomeWorkQuestion homeWorkQuestion = homeWorkQuestionDao.findHomeWorkQuestionByLibelle(homeWorkQstLibelle);
                                    if (homeWorkQuestion == null) {
                                        homeWorkQuestion = new HomeWorkQuestion();
                                        homeWorkQuestion.setTypeDeQuestion(typeDeQuestion);
                                        homeWorkQuestion.setLibelle(homeWorkQstLibelle);
                                        homeWorkQuestion.setPointReponseJuste(1);
                                        homeWorkQuestion.setPointReponsefausse(0);
                                        homeWorkQuestion.setHomeWork(homeWork);
                                        homeWorkQuestion = homeWorkQuestionDao.save(homeWorkQuestion);
                                    }
                                    HoweWorkQSTReponse homeWorkReponse = new HoweWorkQSTReponse();
                                    homeWorkReponse.setEtatReponse("true");
                                    homeWorkReponse.setHomeWorkQuestion(homeWorkQuestion);
                                    homeWorkReponse.setLib(this.translate(homeWorkQuestion.getLibelle()));
                                    homeWorkReponse.setNumero(1L);
                                    homeWorkReponse = homeWorkQSTReponseDao.save(homeWorkReponse);
                                }
                            }
                        }

                    } catch (Exception ex) {
                        Logger.getLogger(DataBaseMigration.class.getName()).log(Level.SEVERE, null, ex);
                    }
                });
    }

    public TypeDeQuestion isTypeQstExist(String lib) {
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
                            String imgName = parcours.getLibelle() + section.getCategorieSection().getLibelle() + FileUtil.fileNameWithOutExt(f.getName()) + "." + fileExtention;

                            String drivePath = this.createFile(parcours.getLibelle(), section.getCategorieSection().getLibelle(), imageNameDestination, imgName);
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

    public String createFile(String parcours, String section, String imgPath, String imgName) throws Exception {
        boolean isParcourFolderExist = false;
        boolean isSectionFolderExist = false;
        boolean isImgExist = false;
        GoogleClientSecrets secrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(gdSecretKeys.getInputStream()));
        flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT, JSON_FACTORY, secrets, SCOPES)
                .setDataStoreFactory(new FileDataStoreFactory(credentialsFolder.getFile())).build();


        Credential cred = this.flow.loadCredential(USER_IDENTIFIER_KEY);
        Permission permission = new Permission();
        permission.setType("anyone");
        permission.setRole("writer");

        Drive drive = new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, cred).setApplicationName(APP_NAME).build();
        com.google.api.services.drive.model.File file = new com.google.api.services.drive.model.File();
        com.google.api.services.drive.model.File folder = new com.google.api.services.drive.model.File();
        com.google.api.services.drive.model.File folder2 = new com.google.api.services.drive.model.File();


        com.google.api.services.drive.model.File uploadedFolder2 = new com.google.api.services.drive.model.File();
        com.google.api.services.drive.model.File uploadedFolder = new com.google.api.services.drive.model.File();
        com.google.api.services.drive.model.File uploadedFile = new com.google.api.services.drive.model.File();
// -------------------------------- FOLDER PARCOURS ----------------------------------------
        FileList sheckFile = drive.files().list().setFields("*").execute();

        for (com.google.api.services.drive.model.File f : sheckFile.getFiles()
        ) {
            System.out.println(f.getName());
            if (Objects.equals(parcours.replaceAll("\\s", "").toUpperCase(), f.getName().replaceAll("\\s", "").toUpperCase())) {
                isParcourFolderExist = true;
                uploadedFolder2 = f;
            }

            if (Objects.equals(section.replaceAll("\\s", "").toUpperCase(), f.getName().replaceAll("\\s", "").toUpperCase())) {
                isSectionFolderExist = true;
                uploadedFolder = f;
            }

            if (Objects.equals(imgName.replaceAll("\\s", "").toUpperCase(), f.getName().replaceAll("\\s", "").toUpperCase())) {
                isImgExist = true;
                uploadedFile = f;
            }
        }
        System.out.println("=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=");
        System.out.println(parcours);
        System.out.println(section);
        System.out.println(imgName);
        System.out.println("#########################################################################");
        System.out.println(isParcourFolderExist);
        System.out.println(isSectionFolderExist);
        System.out.println(isImgExist);
        if (!isParcourFolderExist) {
            folder2.setName(parcours);
            folder2.setMimeType("application/vnd.google-apps.folder");
            uploadedFolder2 = drive.files().create(folder2).setFields("id").execute();
            drive.permissions().create(uploadedFolder2.getId(), permission).execute();

        }

        if (!isSectionFolderExist) {
            folder.setName(section);
            folder.setMimeType("application/vnd.google-apps.folder");
            folder.setParents(Arrays.asList(uploadedFolder2.getId()));
            uploadedFolder = drive.files().create(folder).setFields("id").execute();
            drive.permissions().create(uploadedFolder.getId(), permission).execute();
        }

        if (!isImgExist) {
            file.setName(imgName);
            file.setParents(Arrays.asList(uploadedFolder.getId()));
            FileContent content = new FileContent("image/jpeg", new java.io.File(imgPath));
            uploadedFile = drive.files().create(file, content).setFields("id,thumbnailLink,webContentLink").execute();
            drive.permissions().create(uploadedFile.getId(), permission).execute();
        }

        System.out.println("==============================ID THUMBNAILLINK==============================================");
        System.out.println(uploadedFile.getId());
        System.out.println(uploadedFile.getWebContentLink());
        System.out.println("============================================================================");
        return uploadedFile.getWebContentLink();
    }


    private static final String APP_NAME = "alc-project-drive-img";
    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    private static final List<String> SCOPES = Collections.singletonList(DriveScopes.DRIVE);
    private static final String USER_IDENTIFIER_KEY = "526671645204-pefjgst2s07uo5k8v0srh75pc7i28e8p.apps.googleusercontent.com";
    private GoogleAuthorizationCodeFlow flow;

    @Value("${google.oauth.callback.uri}")
    private String CALLBACK_URL;
    @Value("${google.translate.api}")
    private String GOOGLE_TRANSLATE_API;

    @Value("${google.secret.key.path}")
    private org.springframework.core.io.Resource gdSecretKeys;
    @Value("${google.credentials.folder.path}")
    private Resource credentialsFolder;

}
