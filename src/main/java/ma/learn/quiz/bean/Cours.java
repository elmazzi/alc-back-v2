package ma.learn.quiz.bean;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
public class Cours implements Serializable {
    @Id
    @SequenceGenerator(name = "cour_seq", sequenceName = "cour_seq",
            allocationSize = 1, initialValue = 1000000)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cour_seq")
    private Long id;
    @Lob
	@Column(length=512)
    private String description;
    @Lob
	@Column(length=512)
    private String image;
    @Lob
	@Column(length=512)
    private String libelle;
    private String code;
    private String etatCours;

    @ManyToOne
    private Parcours parcours;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "cours")
    private List<Section> sections;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "cours")
    private List<HomeWork> homeWorkList;

    private int nombreSectionFinalise;
    private int nombreSectionEnCours;
    private int nombreLinkEnCours;
    private int nombreLinkFinalise;

    private int numeroOrder;


    public Cours(String description, String image, String libelle, String code, String etatCours, Parcours parcours,
                 List<Section> sections, int nombreSectionFinalise, int nombreSectionEnCours, int nombreLinkEnCours,
                 int nombreLinkFinalise, int numeroOrder) {
        super();
        this.description = description;
        this.image = image;
        this.libelle = libelle;
        this.code = code;
        this.etatCours = etatCours;
        this.parcours = parcours;
        this.sections = sections;
        this.nombreSectionFinalise = nombreSectionFinalise;
        this.nombreSectionEnCours = nombreSectionEnCours;
        this.nombreLinkEnCours = nombreLinkEnCours;
        this.nombreLinkFinalise = nombreLinkFinalise;
        this.numeroOrder = numeroOrder;
    }

    public String getEtatCours() {
        return etatCours;
    }

    public void setEtatCours(String etatCours) {
        this.etatCours = etatCours;
    }

    public Cours() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Parcours getParcours() {
        return parcours;
    }

    public void setParcours(Parcours parcours) {
        this.parcours = parcours;
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


    public String getDescription() {
        return description;
    }


    public void setDescription(String description) {
        this.description = description;
    }


    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getNombreSectionFinalise() {
        return nombreSectionFinalise;
    }

    public void setNombreSectionFinalise(int nombreSectionFinalise) {
        this.nombreSectionFinalise = nombreSectionFinalise;
    }

    public int getNombreSectionEnCours() {
        return nombreSectionEnCours;
    }

    public void setNombreSectionEnCours(int nombreSectionEnCours) {
        this.nombreSectionEnCours = nombreSectionEnCours;
    }

    public int getNombreLinkEnCours() {
        return nombreLinkEnCours;
    }

    public void setNombreLinkEnCours(int nombreLinkEnCours) {
        this.nombreLinkEnCours = nombreLinkEnCours;
    }

    public int getNombreLinkFinalise() {
        return nombreLinkFinalise;
    }

    public void setNombreLinkFinalise(int nombreLinkFinalise) {
        this.nombreLinkFinalise = nombreLinkFinalise;
    }

    public int getNumeroOrder() {
        return numeroOrder;
    }


    public void setNumeroOrder(int numeroOrder) {
        this.numeroOrder = numeroOrder;
    }


    public List<Section> getSections() {
        return sections;
    }

    public List<HomeWork> getHomeWorkList() {
        return homeWorkList;
    }

    public void setHomeWorkList(List<HomeWork> homeWorkList) {
        this.homeWorkList = homeWorkList;
    }

    public void setSections(List<Section> sections) {
        this.sections = sections;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Cours other = (Cours) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }


}
