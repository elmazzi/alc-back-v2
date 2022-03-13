package ma.learn.quiz.bean;


import javax.persistence.*;
import java.util.Date;

@Entity
public class FreeTrialformule {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
   private Long id;
   private String code;
   @OneToOne
   private Inscription inscription;
   private String dayspeerweek;
   private String timeperday;
   private String teacherGenderoption;
   private String teacherAgeRange;
   private String teacherPersonnality;
   private boolean status;
   @Temporal(TemporalType.DATE)
   private Date dateConfirmation;

    public Date getDateConfirmation() {
        return dateConfirmation;
    }

    public void setDateConfirmation(Date dateConfirmation) {
        this.dateConfirmation = dateConfirmation;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Inscription getInscription() {
        return inscription;
    }

    public void setInscription(Inscription inscription) {
        this.inscription = inscription;
    }

    public String getDayspeerweek() {
        return dayspeerweek;
    }

    public void setDayspeerweek(String dayspeerweek) {
        this.dayspeerweek = dayspeerweek;
    }

    public String getTimeperday() {
        return timeperday;
    }

    public void setTimeperday(String timeperday) {
        this.timeperday = timeperday;
    }

    public String getTeacherGenderoption() {
        return teacherGenderoption;
    }

    public void setTeacherGenderoption(String teacherGenderoption) {
        this.teacherGenderoption = teacherGenderoption;
    }

    public String getTeacherAgeRange() {
        return teacherAgeRange;
    }

    public void setTeacherAgeRange(String teacherAgeRange) {
        this.teacherAgeRange = teacherAgeRange;
    }

    public String getTeacherPersonnality() {
        return teacherPersonnality;
    }

    public void setTeacherPersonnality(String teacherPersonnality) {
        this.teacherPersonnality = teacherPersonnality;
    }
}
