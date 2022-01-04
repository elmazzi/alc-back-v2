package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
public class TrancheHoraireProf {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Prof prof;
    private String datee;

    private Date horaire;

    public String getDatee() {
        return datee;
    }

    public void setDatee(String datee) {
        this.datee = datee;
    }

/*
        @JsonFormat(pattern = "yyyy-MM-dd h:mm:ss")
        private LocalDateTime horaire;


 */

    public Date getHoraire() {
        return horaire;
    }

    public void setHoraire(Date horaire) {
        this.horaire = horaire;
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

/*
    public LocalDateTime getHoraire() {
        return horaire;
    }

    public void setHoraire(LocalDateTime horaire) {
        this.horaire = horaire;
    }


 */

}
