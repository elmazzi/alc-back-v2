package ma.learn.quiz.bean;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class RecommendTeacher {
		 @Id
		   @GeneratedValue(strategy = GenerationType.AUTO)
		private Long id;
		private int nombrevote ;
		private String nom;
		private String ref;
		private String prenom;
		private String commentaire;
		private String telephone;
		private String login;

	private Date dateRecommamdation;
		@ManyToOne
		private Prof prof;
		
		
		public RecommendTeacher() {
			super();
			// TODO Auto-generated constructor stub
		}
		public RecommendTeacher(int nombrevote, String nom, String ref, String prenom, String commentaire,
				String telephone, String login, Prof prof) {
			super();
			this.nombrevote = nombrevote;
			this.nom = nom;
			this.ref = ref;
			this.prenom = prenom;
			this.commentaire = commentaire;
			this.telephone = telephone;
			this.login = login;
			this.prof = prof;
		}
		public String getRef() {
			return ref;
		}
		public void setRef(String ref) {
			this.ref = ref;
		}
		public Prof getProf() {
			return prof;
		}
		public void setProf(Prof prof) {
			this.prof = prof;
		}
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		
		
		public int getNombrevote() {
			return nombrevote;
		}
		public void setNombrevote(int nombrevote) {
			this.nombrevote = nombrevote;
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
		
		public String getCommentaire() {
			return commentaire;
		}
		public void setCommentaire(String commentaire) {
			this.commentaire = commentaire;
		}
		public String getTelephone() {
			return telephone;
		}
		public void setTelephone(String telephone) {
			this.telephone = telephone;
		}
		public String getLogin() {
			return login;
		}
		public void setLogin(String login) {
			this.login = login;
		}

	public Date getDateRecommamdation() {
		return dateRecommamdation;
	}

	public void setDateRecommamdation(Date dateRecommamdation) {
		this.dateRecommamdation = dateRecommamdation;
	}
}
