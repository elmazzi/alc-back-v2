package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Optional;


@Entity
public class HomeWorkEtudiant {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne
	private Etudiant etudiant;
	@ManyToOne()
	private HomeWork homeWork;
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@OneToMany(mappedBy = "homeWorkEtudiant", cascade = CascadeType.REMOVE)
	private List<ReponseEtudiantHomeWork> reponseEtudiantHomeWork;
	private Double note;
	private String resultat;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date date;

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getResultat() {
		return resultat;
	}

	public void setResultat(String resultat) {
		this.resultat = resultat;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Etudiant getEtudiant() {
		return etudiant;
	}

	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}

	public HomeWork getHomeWork() {
		return homeWork;
	}

	public void setHomeWork(HomeWork homeWork) {
		this.homeWork = homeWork;
	}

	public List<ReponseEtudiantHomeWork> getReponseEtudiantHomeWork() {
		return reponseEtudiantHomeWork;
	}

	public void setReponseEtudiantHomeWork(List<ReponseEtudiantHomeWork> reponseEtudiantHomeWork) {
		this.reponseEtudiantHomeWork = reponseEtudiantHomeWork;
	}

	public Double getNote() {
		return note;
	}

	public void setNote(Double note) {
		this.note = note;
	}

}
