package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
public class SessionCours implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String reference;

    @ManyToOne
    private Prof prof;
    @OneToOne
    private Cours cours;
    @ManyToOne
    private GroupeEtudiant groupeEtudiant;
    private double duree;
    private double totalheure;
    private double mois;
    private double annee;
    private Date dateFin;
    private Date dateDebut;
    private boolean payer;
    @ManyToOne
    private Salary salary;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "sessionCours", cascade = CascadeType.REMOVE)
    private List<Section> sections;

    public double getDuree() {
        return duree;
    }

    public void setDuree(double duree) {
        this.duree = duree;
    }

    public double getTotalheure() {
        return totalheure;
    }

    public void setTotalheure(double totalheure) {
        this.totalheure = totalheure;
    }

    public double getMois() {
        return mois;
    }

    public void setMois(double mois) {
        this.mois = mois;
    }

    public double getAnnee() {
        return annee;
    }

    public void setAnnee(double annee) {
        this.annee = annee;
    }

    public List<Section> getSections() {
        return sections;
    }

    public void setSections(List<Section> sections) {
        this.sections = sections;
    }

    public SessionCours() {
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public SessionCours(String reference, Prof prof, Cours cours, GroupeEtudiant groupeEtudiant, Date dateFin, boolean payer, Salary salary) {
        this.reference = reference;
        this.prof = prof;
        this.cours = cours;
        this.groupeEtudiant = groupeEtudiant;
        this.dateFin = dateFin;
        this.payer = payer;
        this.salary = salary;
    }

    public Salary getSalary() {
        return salary;
    }

    public void setSalary(Salary salary) {
        this.salary = salary;
    }

    public Cours getCours() {
        return cours;
    }

    public void setCours(Cours cours) {
        this.cours = cours;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public Prof getProf() {
        return prof;
    }

    public void setProf(Prof prof) {
        this.prof = prof;
    }

    public GroupeEtudiant getGroupeEtudiant() {
        return groupeEtudiant;
    }

    public void setGroupeEtudiant(GroupeEtudiant groupeEtudiant) {
        this.groupeEtudiant = groupeEtudiant;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public boolean isPayer() {
        return payer;
    }

    public void setPayer(boolean payer) {
        this.payer = payer;
    }
}
