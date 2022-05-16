package ma.learn.quiz.bean;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.List;

@Entity
public class HomeWorkQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String ref;
    @Lob
	@Column(length=512)
    private String libelle;
    private int numero;
    private double pointReponseJuste;
    private double pointReponsefausse;
    @ManyToOne
    private TypeDeQuestion typeDeQuestion;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "homeWorkQuestion", cascade = CascadeType.REMOVE)
    private List<HoweWorkQSTReponse> reponses;

    @ManyToOne
    private HomeWork homeWork;

    public List<HoweWorkQSTReponse> getReponses() {
        return reponses;
    }

    public void setReponses(List<HoweWorkQSTReponse> reponses) {
        this.reponses = reponses;
    }

    public HomeWork getHomeWork() {
        return homeWork;
    }

    public void setHomeWork(HomeWork homeWork) {
        this.homeWork = homeWork;
    }


    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public TypeDeQuestion getTypeDeQuestion() {
        return typeDeQuestion;
    }

    public void setTypeDeQuestion(TypeDeQuestion typeDeQuestion) {
        this.typeDeQuestion = typeDeQuestion;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public double getPointReponseJuste() {
        return pointReponseJuste;
    }

    public void setPointReponseJuste(double pointReponseJuste) {
        this.pointReponseJuste = pointReponseJuste;
    }

    public double getPointReponsefausse() {
        return pointReponsefausse;
    }

    public void setPointReponsefausse(double pointReponsefausse) {
        this.pointReponsefausse = pointReponsefausse;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }
}
