package ma.learn.quiz.bean;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.Month;
import java.time.Year;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonFormat;

import ma.learn.quiz.bean.Prof;

@Entity
public class Salary {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Prof prof;
    private int annee;
    private int mois;
    private String  code;
    private BigDecimal nbrSessionMensuel;
    private BigDecimal montantMensuel;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public BigDecimal getNbrSessionMensuel() {
        return nbrSessionMensuel;
    }

    public void setNbrSessionMensuel(BigDecimal nbrSessionMensuel) {
        this.nbrSessionMensuel = nbrSessionMensuel;
    }


    public BigDecimal getMontantMensuel() {
        return montantMensuel;
    }

    public void setMontantMensuel(BigDecimal montantMensuel) {
        this.montantMensuel = montantMensuel;
    }


    public int getAnnee() {
        return annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }

    public int getMois() {
        return mois;
    }

    public void setMois(int mois) {
        this.mois = mois;
    }
}
