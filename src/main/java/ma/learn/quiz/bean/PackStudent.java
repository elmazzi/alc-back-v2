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

}
