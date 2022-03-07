package ma.learn.quiz.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Collection;

@Entity
public class Admin extends User {

	public Admin() {
		super();
	}

	public Admin(User user) {
		super(user.id, user.username, user.password, user.nom, user.prenom,
				user.numero, user.addresse,user.dateNaissance, user.country, user.ville, user.age, user.image, user.accountNonExpired,
				user.credentialsNonExpired, user.accountNonLocked, user.enabled, user.authorities, user.role, user.skype);
	}

	public Admin(String username, String password) {
		super(username, password);
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String login) {
		this.username = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
}
