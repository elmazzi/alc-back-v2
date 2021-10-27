package ma.learn.quiz.service.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.Prof;

import java.util.Date;

public class PaiementVo {
    private Prof prof;


    private Etudiant etudiant;

    private String datePaiement;

    public Prof getProf() {
        return prof;
    }

    public void setProf(Prof prof) {
        this.prof = prof;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public String getDatePaiement() {
        return datePaiement;
    }

    public void setDatePaiement(String datePaiement) {
        this.datePaiement = datePaiement;
    }
}
