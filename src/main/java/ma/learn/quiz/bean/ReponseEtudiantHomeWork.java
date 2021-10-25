package ma.learn.quiz.bean;

import javax.persistence.*;

@Entity
public class ReponseEtudiantHomeWork {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
/*	@ManyToOne
	private Reponse reponse;*/
	private String answer;
	@ManyToOne
	private HomeWorkEtudiant homeWorkEtudiant;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

/*	public Reponse getReponse() {
		return reponse;
	}

	public void setReponse(Reponse reponse) {
		this.reponse = reponse;
	}*/

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

	private Double note;

	
}
