package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
@Entity
public class GroupeEtudiant implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id ;
    private String libelle;
    @JsonFormat(pattern = "dd-MM-yyyy")
    private Date dateDebut;
    @JsonFormat(pattern = "dd-MM-yyyy")
    private Date dateFin;
    private String niveau;

    private Long nombrePlace ;
    private Long  nombrePlacevide;
    private Long  nombrePlaceNonVide; // nombre de place non disponible
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "groupeEtudiant")
    private List<GroupeEtudeDetail> groupeEtudeDetails;
    @ManyToOne
    private GroupeEtude groupeEtude;

    public List<GroupeEtudeDetail> getGroupeEtudeDetails() {
        return groupeEtudeDetails;
    }

    public void setGroupeEtudeDetails(List<GroupeEtudeDetail> groupeEtudeDetails) {
        this.groupeEtudeDetails = groupeEtudeDetails;
    }

    public GroupeEtude getGrpEtude() {
        return groupeEtude;
    }

    public void setGrpEtude(GroupeEtude groupeEtude) {
        this.groupeEtude = groupeEtude;
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

    public List<GroupeEtudeDetail> getGroupeEtudiantDetails() {
        return groupeEtudeDetails;
    }

    public void setGroupeEtudiantDetails(List<GroupeEtudeDetail> groupeEtudeDetails) {
        this.groupeEtudeDetails = groupeEtudeDetails;
    }

    public GroupeEtude getGroupeEtude() {
        return groupeEtude;
    }

    public void setGroupeEtude(GroupeEtude groupeEtude) {
        this.groupeEtude = groupeEtude;
    }
}
