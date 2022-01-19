package ma.learn.quiz.bean;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Inscription {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int numeroInscription;
    @ManyToOne
    private Etudiant etudiant;
    @ManyToOne
    private EtatInscription etatInscription;
    @ManyToOne
    private Prof prof;
    @ManyToOne
    private Parcours parcours;
    @ManyToOne
    private GroupeEtude groupeEtude;
    @ManyToOne
    private StatutSocial statutSocial;
    @ManyToOne
    private InteretEtudiant interetEtudiant;
    @ManyToOne
    private NiveauEtude niveauEtude;
    @ManyToOne
    private  Fonction fonction;

    @Temporal(TemporalType.DATE)
    private Date datedebutinscription;
    @Temporal(TemporalType.DATE)
    private Date datefininscription;
    @ManyToOne
    private PackStudent packStudent;

    public StatutSocial getStatutSocial() {
        return statutSocial;
    }

    public void setStatutSocial(StatutSocial statutSocial) {
        this.statutSocial = statutSocial;
    }

    public InteretEtudiant getInteretEtudiant() {
        return interetEtudiant;
    }

    public void setInteretEtudiant(InteretEtudiant interetEtudiant) {
        this.interetEtudiant = interetEtudiant;
    }

    public NiveauEtude getNiveauEtude() {
        return niveauEtude;
    }

    public void setNiveauEtude(NiveauEtude niveauEtude) {
        this.niveauEtude = niveauEtude;
    }

    public Fonction getFonction() {
        return fonction;
    }

    public void setFonction(Fonction fonction) {
        this.fonction = fonction;
    }

    public GroupeEtude getGroupeEtude() {
        return groupeEtude;
    }

    public void setGroupeEtude(GroupeEtude groupeEtude) {
        this.groupeEtude = groupeEtude;
    }

    public Prof getProf() {
        return prof;
    }

    public void setProf(Prof prof) {
        this.prof = prof;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public int getNumeroInscription() {
        return numeroInscription;
    }

    public void setNumeroInscription(int numeroInscription) {
        this.numeroInscription = numeroInscription;
    }

    public Date getDatedebutinscription() {
        return datedebutinscription;
    }

    public void setDatedebutinscription(Date datedebutinscription) {
        this.datedebutinscription = datedebutinscription;
    }

    public Date getDatefininscription() {
        return datefininscription;
    }

    public void setDatefininscription(Date datefininscription) {
        this.datefininscription = datefininscription;
    }

    public EtatInscription getEtatInscription() {
        return etatInscription;
    }

    public void setEtatInscription(EtatInscription etatInscription) {
        this.etatInscription = etatInscription;
    }

    public Parcours getParcours() {
        return parcours;
    }

    public void setParcours(Parcours parcours) {
        this.parcours = parcours;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public PackStudent getPackStudent() {
        return packStudent;
    }

    public void setPackStudent(PackStudent packStudent) {
        this.packStudent = packStudent;
    }
}



