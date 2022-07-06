package ma.learn.quiz.bean;

import javax.persistence.*;

@Entity
public class HoweWorkQSTReponse {


    @Id
    @SequenceGenerator(name = "homeworkqstrps_seq", sequenceName = "homeworkqstrps_seq",
            allocationSize = 1, initialValue = 1000000)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "homeworkqstrps_seq")
    private Long id;
    private String ref;
    @Lob
	@Column(length=512)
    private String lib;
    private String etatReponse;
    private int numero;

    @ManyToOne
    private HomeWorkQuestion homeWorkQuestion;

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

    public String getLib() {
        return lib;
    }

    public void setLib(String lib) {
        this.lib = lib;
    }

    public String getEtatReponse() {
        return etatReponse;
    }

    public void setEtatReponse(String etatReponse) {
        this.etatReponse = etatReponse;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public HomeWorkQuestion getHomeWorkQuestion() {
        return homeWorkQuestion;
    }

    public void setHomeWorkQuestion(HomeWorkQuestion homeWorkQuestion) {
        this.homeWorkQuestion = homeWorkQuestion;
    }
}
