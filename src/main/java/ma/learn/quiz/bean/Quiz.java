package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Quiz {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String ref;
    @Lob
	@Column(length=512)
    private String lib;
   // @JsonFormat(pattern = "MM/dd/yyyy hh:mm:ss")
    private Date dateDebut;
   // @JsonFormat(pattern = "MM/dd/yyyy hh:mm:ss")
    private Date dateFin;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
   @OneToMany(mappedBy = "quiz")
    private List<Question> questions;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "quiz")
     private List<QuizEtudiant> quizEtudiant;
    @OneToOne
    private Section section;
    private Long numero;
    private Long seuilReussite;
   

    
    public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public List<QuizEtudiant> getQuizEtudiant() {
		return quizEtudiant;
	}

	public void setQuizEtudiant(List<QuizEtudiant> quizEtudiant) {
		this.quizEtudiant = quizEtudiant;
	}

	public Date getDateDebut() {
        return dateDebut;
    }

    public Long getSeuilReussite() {
        return seuilReussite;
    }

    public void setSeuilReussite(Long seuilReussite) {
        this.seuilReussite = seuilReussite;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public Long getNumero() {
        return numero;
    }

    public void setNumero(Long numero) {
        this.numero = numero;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    /*public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }*/

    public String getLib() {
        return lib;
    }

    public void setLib(String lib) {
        this.lib = lib;
    }
}
