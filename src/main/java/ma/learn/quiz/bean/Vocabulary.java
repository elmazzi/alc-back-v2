package ma.learn.quiz.bean;

import javax.persistence.*;

@Entity
public class Vocabulary {



	@Id
	@SequenceGenerator(name = "voc_seq", sequenceName = "voc_seq",
			allocationSize = 1, initialValue = 200000)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "voc_seq")
	private Long id;
	private Long numero;
	private String word;
	@Lob
	@Column(length=512)
	private String libelle;
	private String result;
	@Lob
	@Column(length=512)
	private String explication;
	@Lob
	@Column(length=512)
	private String exemple;
	@Lob
	@Column(length=512)
	private String image;
	private String ref;
	@OneToOne
	private Section section;
	@ManyToOne
	private VocabularyQuiz vocabularyQuiz;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getExplication() {
		return explication;
	}

	public void setExplication(String explication) {
		this.explication = explication;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getExemple() {
		return exemple;
	}

	public void setExemple(String exemple) {
		this.exemple = exemple;
	}

	public VocabularyQuiz getVocabularyQuiz() {
		return vocabularyQuiz;
	}

	public void setVocabularyQuiz(VocabularyQuiz vocabularyQuiz) {
		this.vocabularyQuiz = vocabularyQuiz;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	public Long getNumero() {
		return numero;
	}


	public void setNumero(Long numero) {
		this.numero = numero;
	}

}
