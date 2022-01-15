package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
public class WorkloadBonus {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int nombreSession;
    private BigDecimal prix;


    public BigDecimal getPrix() {
        return prix;
    }

    public void setPrix(BigDecimal prix) {
        this.prix = prix;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getNombreSession() {
        return nombreSession;
    }

    public void setNombreSession(int nombreSession) {
        this.nombreSession = nombreSession;
    }
}
