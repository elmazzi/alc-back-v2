package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
public class InviteStudent {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String code;
    @ManyToOne
    private Etudiant etudiant;
    private boolean isAccepted;
    private boolean isPaidPack;
    private String emailInvited;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    private Date dateSentInvitation;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public boolean isAccepted() {
        return isAccepted;
    }

    public void setAccepted(boolean accepted) {
        isAccepted = accepted;
    }

    public boolean isPaidPack() {
        return isPaidPack;
    }

    public void setPaidPack(boolean paidPack) {
        isPaidPack = paidPack;
    }

    public String getEmailInvited() {
        return emailInvited;
    }

    public void setEmailInvited(String emailInvited) {
        this.emailInvited = emailInvited;
    }

    public Date getDateSentInvitation() {
        return dateSentInvitation;
    }

    public void setDateSentInvitation(Date dateSentInvitation) {
        this.dateSentInvitation = dateSentInvitation;
    }
}
