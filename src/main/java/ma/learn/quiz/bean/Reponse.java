package ma.learn.quiz.bean;

import javax.persistence.*;

@Entity
public class Reponse {


	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String ref;
    @Lob
	@Column(length=512)
    private String lib;
    private String etatReponse;
    private Long numero;
    @ManyToOne
    private Question question;

	public String getEtatReponse() {
		return etatReponse;
	}

	public void setEtatReponse(String etatReponse) {
		this.etatReponse = etatReponse;
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

    public String getLib() {
        return lib;
    }

    public void setLib(String lib) {
        this.lib = lib;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }
    public Long getNumero() {
		return numero;
	}

	public void setNumero(Long numero) {
		this.numero = numero;
	}
}
