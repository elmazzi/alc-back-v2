package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;


@Entity
public class Section implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
//    @SequenceGenerator(name = "produit_seq", sequenceName = "produit_seq",
//            allocationSize = 1, initialValue = 10000)
    private Long id;
    private String code;
    @Lob
    @Column(length = 512)
    private String libelle;
    @Lob
    @Column(length = 512)
    private String urlImage;
    @Lob
    @Column(length = 512)
    private String urlImage2;
    @Lob
    @Column(length = 512)
    private String urlImage3;
    @Lob
    @Column(length = 512)
    private String urlVideo;
    @Lob
    @Column(length = 512)
    private String contenu;
    @Lob
    @Column(length = 512)
    private String questions;
    @Lob
    @Column(length = 512)
    private String indicationProf;
    private Integer numeroOrder;
    @ManyToOne
    private CategorieSection categorieSection;
    @ManyToOne
    private Cours cours;

    private int url;
    private int content;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "section", cascade = CascadeType.REMOVE)
    private List<SectionItem> sectionItems;

    @ManyToOne
    private SessionCours sessionCours;

    public Section(String code, String libelle, String urlImage, String urlImage2, String urlImage3,
                   String urlVideo, String contenu, String questions, String indicationProf, Integer numeroOrder,
                   CategorieSection categorieSection, Cours cours, int url, int content) {
        super();
        this.code = code;
        this.libelle = libelle;
        this.urlImage = urlImage;
        this.urlImage2 = urlImage2;
        this.urlImage3 = urlImage3;
        this.urlVideo = urlVideo;
        this.contenu = contenu;
        this.questions = questions;
        this.indicationProf = indicationProf;
        this.numeroOrder = numeroOrder;
        this.categorieSection = categorieSection;
        this.cours = cours;
        this.url = url;
        this.content = content;
    }

    public SessionCours getSessionCours() {
        return sessionCours;
    }

    public void setSessionCours(SessionCours sessionCours) {
        this.sessionCours = sessionCours;
    }

    public int getUrl() {
        return url;
    }

    public void setUrl(int url) {
        this.url = url;
    }

    public int getContent() {
        return content;
    }

    public void setContent(int content) {
        this.content = content;
    }

    public Integer getNumeroOrder() {
        return numeroOrder;
    }

    public void setNumeroOrder(Integer numeroOrder) {
        this.numeroOrder = numeroOrder;
    }

    public Section() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContenu() {
        return contenu;
    }


    public void setContenu(String contenu) {
        this.contenu = contenu;
    }


    public String getQuestions() {
        return questions;
    }


    public void setQuestions(String questions) {
        this.questions = questions;
    }


    public String getIndicationProf() {
        return indicationProf;
    }


    public void setIndicationProf(String indicationProf) {
        this.indicationProf = indicationProf;
    }


    public CategorieSection getCategorieSection() {
        return categorieSection;
    }


    public void setCategorieSection(CategorieSection categorieSection) {
        this.categorieSection = categorieSection;
    }


    public Cours getCours() {
        return cours;
    }


    public void setCours(Cours cours) {
        this.cours = cours;
    }


    public String getLibelle() {
        return libelle;
    }


    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public String getUrlImage2() {
        return urlImage2;
    }

    public void setUrlImage2(String urlImage2) {
        this.urlImage2 = urlImage2;
    }

    public String getUrlImage3() {
        return urlImage3;
    }

    public void setUrlImage3(String urlImage3) {
        this.urlImage3 = urlImage3;
    }

    public String getUrlVideo() {
        return urlVideo;
    }

    public void setUrlVideo(String urlVideo) {
        this.urlVideo = urlVideo;
    }

    public List<SectionItem> getSectionItems() {
        return sectionItems;
    }

    public void setSectionItems(List<SectionItem> sectionItems) {
        this.sectionItems = sectionItems;
    }

    @Override
    public String toString() {
        return "Section{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", libelle='" + libelle + '\'' +
                ", urlImage='" + urlImage + '\'' +
                ", urlImage2='" + urlImage2 + '\'' +
                ", urlImage3='" + urlImage3 + '\'' +
                ", urlVideo='" + urlVideo + '\'' +
                ", contenu='" + contenu + '\'' +
                ", questions='" + questions + '\'' +
                ", indicationProf='" + indicationProf + '\'' +
                ", numeroOrder=" + numeroOrder +
                ", categorieSection=" + categorieSection +
                ", cours=" + cours +
                ", url=" + url +
                ", content=" + content +
                ", sectionItems=" + sectionItems +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Section section = (Section) o;
        return url == section.url && content == section.content && Objects.equals(id, section.id) && Objects.equals(code, section.code) && Objects.equals(libelle, section.libelle) && Objects.equals(urlImage, section.urlImage) && Objects.equals(urlImage2, section.urlImage2) && Objects.equals(urlImage3, section.urlImage3) && Objects.equals(urlVideo, section.urlVideo) && Objects.equals(contenu, section.contenu) && Objects.equals(questions, section.questions) && Objects.equals(indicationProf, section.indicationProf) && Objects.equals(numeroOrder, section.numeroOrder) && Objects.equals(categorieSection, section.categorieSection) && Objects.equals(cours, section.cours) && Objects.equals(sectionItems, section.sectionItems);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, code, libelle, urlImage, urlImage2, urlImage3, urlVideo, contenu, questions, indicationProf, numeroOrder, categorieSection, cours, url, content, sectionItems);
    }
}
