package ma.learn.quiz.bean;

import javax.persistence.*;

@Entity
public class FaqEtudiant {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	@Lob
	@Column(length=512)
	private String libelle;
	@Lob
	@Column(length=512)
	private String description;
	@ManyToOne
	private Etudiant etudiant;
	@ManyToOne
	private FaqType faqType;
	@ManyToOne
	private Admin admin;
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
	public Etudiant getEtudiant() {
		return etudiant;
	}
	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public FaqType getFaqType() {
		return faqType;
	}
	public void setFaqType(FaqType faqType) {
		this.faqType = faqType;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	

}
