package ma.learn.quiz.bean;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonProperty;
@Entity
public class SuperCategorieSection implements Serializable{
	 @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
     private Long id;

     private String code ;
	@Lob
	@Column(length=512)
	private String libelle ;
     @JsonProperty(access=JsonProperty.Access.WRITE_ONLY)
     @OneToMany(mappedBy="superCategorieSection")
     private List<CategorieSection> categorieSections;
    
	
	
	

	public SuperCategorieSection(String code, String libelle, List<CategorieSection> categorieSections) {
		super();
		this.code = code;
		this.libelle = libelle;
		this.categorieSections = categorieSections;
	}

	public List<CategorieSection> getCategorieSections() {
		return categorieSections;
	}

	public void setCategorieSections(List<CategorieSection> categorieSections) {
		this.categorieSections = categorieSections;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public SuperCategorieSection() {
		super();
		// TODO Auto-generated constructor stub
	}

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
	
	
}
