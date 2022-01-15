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
    private Double prix;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "packStudent")
    private List<Etudiant> students;

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

    public List<Etudiant> getStudents() {
        return students;
    }

    public void setStudents(List<Etudiant> students) {
        this.students = students;
    }
}
