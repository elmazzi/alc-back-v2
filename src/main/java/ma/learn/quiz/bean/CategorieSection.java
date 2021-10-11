package ma.learn.quiz.bean;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
public class CategorieSection implements Serializable{

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String libelle ;
    private String code ;
    private Integer numeroOrder;
    @ManyToOne
	private SuperCategorieSection superCategorieSection ;
    @JsonProperty(access=JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy="cours")
    private List<Section> sections;



	public CategorieSection(String libelle, String code, Integer numeroOrder,
			SuperCategorieSection superCategorieSection, List<Section> sections) {
		super();
		this.libelle = libelle;
		this.code = code;
		this.numeroOrder = numeroOrder;
		this.superCategorieSection = superCategorieSection;
		this.sections = sections;
	}






	public List<Section> getSections() {
		return sections;
	}






	public void setSections(List<Section> sections) {
		this.sections = sections;
	}






	public CategorieSection() {
	super();
	// TODO Auto-generated constructor stub
}





	
	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

   
   
	public String getCode() {
		return code;
	}



	public void setCode(String code) {
		this.code = code;
	}






	public Integer getNumeroOrder() {
		return numeroOrder;
	}






	public void setNumeroOrder(Integer numeroOrder) {
		this.numeroOrder = numeroOrder;
	}






	public SuperCategorieSection getSuperCategorieSection() {
		return superCategorieSection;
	}






	public void setSuperCategorieSection(SuperCategorieSection superCategorieSection) {
		this.superCategorieSection = superCategorieSection;
	}






	public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

   
}
