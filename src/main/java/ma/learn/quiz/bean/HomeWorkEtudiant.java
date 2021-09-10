package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.List;


@Entity
public class HomeWorkEtudiant {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne
	private Etudiant etudiant;
	@ManyToOne
	private HomeWork homeWork;
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@OneToMany(mappedBy = "homeWorkEtudiant")
	private List<ReponseEtudiantHomeWork> reponseEtudiantHomeWork;
	private Double note;

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

	public HomeWork getHomeWok() {
		return homeWork;
	}

	public void setHomeWok(HomeWork homeWork) {
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
