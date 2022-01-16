package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Entity
public class
GroupeEtudiant implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String libelle;
    @JsonFormat(pattern = "dd-MM-yyyy")
    private Date dateDebut;
    @JsonFormat(pattern = "dd-MM-yyyy")
    private Date dateFin;
    private String niveau;
    private Long nombrePlace;
    private Long nombrePlacevide;
    private Long nombrePlaceNonVide; // nombre de place non disponible
    @OneToMany(mappedBy = "groupeEtudiant")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private List<GroupeEtudiantDetail> groupeEtudiantDetails;
    @ManyToOne
    private GroupeEtude groupeEtude;
    @ManyToOne
    private Parcours parcours;
    @ManyToOne
    private Prof prof;

    public Prof getProf() {
        return prof;
    }

    public void setProf(Prof prof) {
        this.prof = prof;
    }

    public Parcours getParcours() {
        return parcours;
    }

    public void setParcours(Parcours parcours) {
        this.parcours = parcours;
    }

    public GroupeEtude getGroupeEtude() {
        return groupeEtude;
    }

    public void setGroupeEtude(GroupeEtude groupeEtude) {
        this.groupeEtude = groupeEtude;
    }

    @JsonIgnore
    public List<GroupeEtudiantDetail> getGroupeEtudeDetails() {
        return groupeEtudiantDetails;
    }

    public void setGroupeEtudeDetails(List<GroupeEtudiantDetail> groupeEtudiantDetails) {
        this.groupeEtudiantDetails = groupeEtudiantDetails;
    }

    public List<GroupeEtudiantDetail> getGroupeEtudiantDetails() {
        return groupeEtudiantDetails;
    }

    public void setGroupeEtudiantDetails(List<GroupeEtudiantDetail> groupeEtudiantDetails) {
        this.groupeEtudiantDetails = groupeEtudiantDetails;
    }


    public void setId(Long id) {
        this.id = id;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    public Long getId() {
        return id;
    }

    public String getLibelle() {
        return libelle;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public String getNiveau() {
        return niveau;
    }

    public Long getNombrePlace() {
        return nombrePlace;
    }

    public void setNombrePlace(Long nombrePlace) {
        this.nombrePlace = nombrePlace;
    }

    public Long getNombrePlacevide() {
        return nombrePlacevide;
    }

    public void setNombrePlacevide(Long nombrePlacevide) {
        this.nombrePlacevide = nombrePlacevide;
    }

    public Long getNombrePlaceNonVide() {
        return nombrePlaceNonVide;
    }

    public void setNombrePlaceNonVide(Long nombrePlaceNonVide) {
        this.nombrePlaceNonVide = nombrePlaceNonVide;
    }
}
