package ma.learn.quiz.bean;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;


@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Dictionary {
	 @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private Long id;
	@Lob
	@Column(length=512)
	private String word;
	@Lob
	@Column(length=512)
	private String definition;
	 @ManyToOne
	 private Etudiant etudiant;


	/*public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getDefinition() {
		return definition;
	}
	public void setDefinition(String definition) {
		this.definition = definition;
	}
	public Etudiant getEtudiant() {
		return etudiant;
	}
	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}
	 */

}

