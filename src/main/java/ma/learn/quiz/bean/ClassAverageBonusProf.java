package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
public class ClassAverageBonusProf {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Prof prof;
    @ManyToOne
    private ClassAverageBonus classAverageBonus;
    private int mois;
    private int annee;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date dateGetBonus;

    public Date getDateGetBonus() {
        return dateGetBonus;
    }

    public void setDateGetBonus(Date dateGetBonus) {
        this.dateGetBonus = dateGetBonus;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Prof getProf() {
        return prof;
    }

    public void setProf(Prof prof) {
        this.prof = prof;
    }

    public ClassAverageBonus getClassAverageBonus() {
        return classAverageBonus;
    }

    public void setClassAverageBonus(ClassAverageBonus classAverageBonus) {
        this.classAverageBonus = classAverageBonus;
    }

    public int getMois() {
        return mois;
    }

    public void setMois(int mois) {
        this.mois = mois;
    }

    public int getAnnee() {
        return annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }
}
