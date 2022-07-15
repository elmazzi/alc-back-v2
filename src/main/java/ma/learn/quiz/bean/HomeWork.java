package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class HomeWork {
    @Id
    @SequenceGenerator(name = "homework_seq", sequenceName = "homework_seq",
            allocationSize = 1, initialValue = 100088)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "homework_seq")
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Lob
	@Column(length=512)
    private String libelle;
    @Lob
	@Column(length=512)
    private String urlImage;
    @Lob
	@Column(length=512)
    private String urlVideo;
    @OneToMany(mappedBy = "homeWork", cascade = CascadeType.REMOVE)
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private List<HomeWorkQuestion> questions;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "homeWork", cascade = CascadeType.REMOVE)
    private List<HomeWorkEtudiant> homeWorkEtudiant;

    @ManyToOne
    private Cours cours;

    @ManyToOne
    private TypeHomeWork typeHomeWork;

    public TypeHomeWork getTypeHomeWork() {
        return typeHomeWork;
    }

    public void setTypeHomeWork(TypeHomeWork typeHomeWork) {
        this.typeHomeWork = typeHomeWork;
    }

    public List<HomeWorkQuestion> getQuestions() {
        return questions;
    }

    public void setQuestions(List<HomeWorkQuestion> questions) {
        this.questions = questions;
    }

    public List<HomeWorkEtudiant> getHomeWorkEtudiant() {
        return homeWorkEtudiant;
    }

    public void setHomeWorkEtudiant(List<HomeWorkEtudiant> homeWorkEtudiant) {
        this.homeWorkEtudiant = homeWorkEtudiant;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public String getUrlVideo() {
        return urlVideo;
    }

    public void setUrlVideo(String urlVideo) {
        this.urlVideo = urlVideo;
    }


    public Cours getCours() {
        return cours;
    }

    public void setCours(Cours cours) {
        this.cours = cours;
    }
}
