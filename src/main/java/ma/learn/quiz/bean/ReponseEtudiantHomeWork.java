package ma.learn.quiz.bean;

import org.hibernate.annotations.Columns;

import javax.persistence.*;

@Entity
public class ReponseEtudiantHomeWork {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private HoweWorkQSTReponse reponse;
    @Lob
	@Column(length=512)
    private String answer;
    @ManyToOne
    private HomeWorkEtudiant homeWorkEtudiant;
    @ManyToOne
    private HomeWorkQuestion question;
    @Column(length = 10000)
    private String profNote;
    private Double note;

    public String getProfNote() {
        return profNote;
    }

    public void setProfNote(String profNote) {
        this.profNote = profNote;
    }

    public Long getId() {
        return id;
    }

    public HomeWorkQuestion getQuestion() {
        return question;
    }

    public void setQuestion(HomeWorkQuestion question) {
        this.question = question;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public HoweWorkQSTReponse getReponse() {
        return reponse;
    }

    public void setReponse(HoweWorkQSTReponse reponse) {
        this.reponse = reponse;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public HomeWorkEtudiant getHomeWorkEtudiant() {
        return homeWorkEtudiant;
    }

    public void setHomeWorkEtudiant(HomeWorkEtudiant homeWorkEtudiant) {
        this.homeWorkEtudiant = homeWorkEtudiant;
    }

    public Double getNote() {
        return note;
    }

    public void setNote(Double note) {
        this.note = note;
    }




}
