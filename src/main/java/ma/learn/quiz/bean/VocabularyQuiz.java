package ma.learn.quiz.bean;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
public class VocabularyQuiz {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Lob
	@Column(length=512)
	private String libelle;
	private Date dateDebut;
	private Date dateFin;
	private String ref;
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@OneToMany(mappedBy = "vocabularyQuiz")
	private List<Vocabulary> vocabularies;
	@OneToOne
	private Section section;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public Date getDateDebut() {
		return dateDebut;
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

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public List<Vocabulary> getVocabularies() {
		return vocabularies;
	}

	public void setVocabularies(List<Vocabulary> vocabularies) {
		this.vocabularies = vocabularies;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

}
