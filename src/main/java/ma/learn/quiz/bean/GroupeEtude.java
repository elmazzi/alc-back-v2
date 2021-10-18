package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class GroupeEtude implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id ;
    private String libelle;
    private String description;
    private Long nombreEtudiant;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "groupeEtude")
    private List<GroupeEtudeDetail> groupeEtudeDetails;

    public List<GroupeEtudeDetail> getGroupeEtudeDetails() {
        return groupeEtudeDetails;
    }

    public void setGroupeEtudeDetails(List<GroupeEtudeDetail> groupeEtudeDetails) {
        this.groupeEtudeDetails = groupeEtudeDetails;
    }

    public Long getNombreEtudiant() {
        return nombreEtudiant;
    }
    public Long getId() {
        return id;
    }

    public String getLibelle() {
        return libelle;
    }

    public String getDescription() {
        return description;
    }

    public void setNombreEtudiant(Long nombreEtudiant) {
        this.nombreEtudiant = nombreEtudiant;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public void setDescription(String description) {
        this.description = description;
    }



}
