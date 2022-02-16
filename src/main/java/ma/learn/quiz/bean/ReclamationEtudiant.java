package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
public class ReclamationEtudiant {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String reference;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date dateReclamation;
    private String message;
    private Boolean traite;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date dateTraitement;
    private String commentaireTraiteur;
    private Long noteEtudiant;
    @ManyToOne
    private Etudiant etudiant;
    @ManyToOne
    private TypeReclamationEtudiant typeReclamationEtudiant;

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

    public Date getDateReclamation() {
        return dateReclamation;
    }

    public void setDateReclamation(Date dateReclamation) {
        this.dateReclamation = dateReclamation;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getTraite() {
        return traite;
    }

    public void setTraite(Boolean traite) {
        this.traite = traite;
    }

    public Date getDateTraitement() {
        return dateTraitement;
    }

    public void setDateTraitement(Date dateTraitement) {
        this.dateTraitement = dateTraitement;
    }

    public String getCommentaireTraiteur() {
        return commentaireTraiteur;
    }

    public void setCommentaireTraiteur(String commentaireTraiteur) {
        this.commentaireTraiteur = commentaireTraiteur;
    }

    public Long getNoteEtudiant() {
        return noteEtudiant;
    }

    public void setNoteEtudiant(Long noteEtudiant) {
        this.noteEtudiant = noteEtudiant;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public TypeReclamationEtudiant getTypeReclamationEtudiant() {
        return typeReclamationEtudiant;
    }

    public void setTypeReclamationEtudiant(TypeReclamationEtudiant typeReclamationEtudiant) {
        this.typeReclamationEtudiant = typeReclamationEtudiant;
    }
}
