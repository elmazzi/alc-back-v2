package ma.learn.quiz.bean;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
public class ClassAverageBonus {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String code;
    private int nombreSession;
    private BigDecimal prix;

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


    public int getNombreSession() {
        return nombreSession;
    }

    public void setNombreSession(int nombreSession) {
        this.nombreSession = nombreSession;
    }

    public BigDecimal getPrix() {
        return prix;
    }

    public void setPrix(BigDecimal prix) {
        this.prix = prix;
    }
}
