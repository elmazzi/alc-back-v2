package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import java.util.Date;

@Entity
public class ReclamationEtudiant {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String reference;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
    private Date dateReclamation;
    @Lob
	@Column(length=512)
    private String message;
    private String setFrom;
    private String img;
    private Boolean traite;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
    private Date dateTraitement;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
    private Date dateReponse;
    private boolean postView;
    private String objetReclamationEtudiant;
    private String commentaireTraiteur;
    @ManyToOne
    private User user;
    @ManyToOne
    @JoinColumn(nullable = true)
    @Nullable
    private TypeReclamationEtudiant typeReclamationEtudiant;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isPostView() {
        return postView;
    }

    public void setPostView(boolean postView) {
        this.postView = postView;
    }

    public Date getDateReponse() {
        return dateReponse;
    }

    public void setDateReponse(Date dateReponse) {
        this.dateReponse = dateReponse;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getObjetReclamationEtudiant() {
        return objetReclamationEtudiant;
    }

    public void setObjetReclamationEtudiant(String objetReclamationEtudiant) {
        this.objetReclamationEtudiant = objetReclamationEtudiant;
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

    public String getSetFrom() {
        return setFrom;
    }

    public void setSetFrom(String setFrom) {
        this.setFrom = setFrom;
    }

    public String getCommentaireTraiteur() {
        return commentaireTraiteur;
    }

    public void setCommentaireTraiteur(String commentaireTraiteur) {
        this.commentaireTraiteur = commentaireTraiteur;
    }



    public TypeReclamationEtudiant getTypeReclamationEtudiant() {
        return typeReclamationEtudiant;
    }

    public void setTypeReclamationEtudiant(TypeReclamationEtudiant typeReclamationEtudiant) {
        this.typeReclamationEtudiant = typeReclamationEtudiant;
    }
}
