package ma.learn.quiz.bean;


import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.List;

@Entity
public class PackStudent {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int nombreCours;
    private boolean forGroupe;
    private String code;
    private String libelle;
    @Lob
    @Column(length=512)
    private String description;
    @Lob
    @Column(length=512)
    private String preRequisites;
    @Lob
    @Column(length=512)
    private String whyTakeThisCourse;
    @Lob
    @Column(length=512)
    private String expectations;
    @ManyToOne
    private Parcours level;

    private String imgUrl;
    private Double prix;
    private int totalStudents;

    public int getTotalStudents() {
        return totalStudents;
    }

    public void setTotalStudents(int totalStudents) {
        this.totalStudents = totalStudents;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getNombreCours() {
        return nombreCours;
    }

    public void setNombreCours(int nombreCours) {
        this.nombreCours = nombreCours;
    }

    public boolean isForGroupe() {
        return forGroupe;
    }

    public void setForGroupe(boolean forGroupe) {
        this.forGroupe = forGroupe;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getPreRequisites() {
        return preRequisites;
    }

    public void setPreRequisites(String preRequisites) {
        this.preRequisites = preRequisites;
    }

    public String getWhyTakeThisCourse() {
        return whyTakeThisCourse;
    }

    public void setWhyTakeThisCourse(String whyTakeThisCourse) {
        this.whyTakeThisCourse = whyTakeThisCourse;
    }

    public String getExpectations() {
        return expectations;
    }

    public void setExpectations(String expectations) {
        this.expectations = expectations;
    }

    public Parcours getLevel() {
        return level;
    }

    public void setLevel(Parcours level) {
        this.level = level;
    }
}
