package ma.learn.quiz.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Admin extends User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String numero;
    private String nom;
    private String prenom;
    private String login;
    private String image;
    private String password;
    public String addresse;

	public Admin(String username, String password) {
		super(username, password);
	}

	public Admin() {

	}

	public Long getId() {
        return id;
    }

    public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAddresse() {
		return addresse;
	}

	public void setAddresse(String addresse) {
		this.addresse = addresse;
	}

	public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
}
