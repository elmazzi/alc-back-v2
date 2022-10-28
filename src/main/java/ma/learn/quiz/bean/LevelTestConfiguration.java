package ma.learn.quiz.bean;

import javax.persistence.*;

@Entity
public class LevelTestConfiguration {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)

    private Long id;
    private double noteMin;
    private double noteMax;
    @ManyToOne
    private Parcours parcours;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getNoteMin() {
        return noteMin;
    }

    public void setNoteMin(double noteMin) {
        this.noteMin = noteMin;
    }

    public double getNoteMax() {
        return noteMax;
    }

    public void setNoteMax(double noteMax) {
        this.noteMax = noteMax;
    }

    public Parcours getParcours() {
        return parcours;
    }

    public void setParcours(Parcours parcours) {
        this.parcours = parcours;
    }
}
