package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
public class Paiement {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private double totalHeure;
    private double montant;
    private int nonPaye;
    @ManyToOne
    private Prof prof;
    private int totalcours;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date datePaiement;
    @OneToOne
    private SessionCours sessionCours;

    public SessionCours getSessionCours() {
        return sessionCours;
    }

    public void setSessionCours(SessionCours sessionCours) {
        this.sessionCours = sessionCours;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getTotalHeure() {
        return totalHeure;
    }

    public void setTotalHeure(double totalHeure) {
        this.totalHeure = totalHeure;
    }

    public double getMontant() {
        return montant;
    }

    public void setMontant(double montant) {
        this.montant = montant;
    }

    public int getNonPaye() {
        return nonPaye;
    }

    public void setNonPaye(int nonPaye) {
        this.nonPaye = nonPaye;
    }

    public Prof getProf() {
        return prof;
    }

    public void setProf(Prof prof) {
        this.prof = prof;
    }

    public int getTotalcours() {
        return totalcours;
    }

    public void setTotalcours(int totalcours) {
        this.totalcours = totalcours;
    }

    public Date getDatePaiement() {
        return datePaiement;
    }

    public void setDatePaiement(Date datePaiement) {
        this.datePaiement = datePaiement;
    }
}
