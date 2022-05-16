package ma.learn.quiz.bean;

import java.util.Date;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
public class News {
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.AUTO)
	 
	 private Long id;
	 private String ref;
	@Lob
	@Column(length=512)
	private String libelle;
	 private String image;
	@Lob
	@Column(length=512)
	private String description;
	 @JsonFormat(pattern = "dd/MM/yyyy")
	 private Date date;
	 @JsonFormat(pattern = "dd/MM/yyyy")
	 private Date dateDebut;
	 @JsonFormat(pattern = "dd/MM/yyyy")
	 private Date dateFin;
	 private int numeroOrdre;
	 private String destinataire;
	 
	public String getDestinataire() {
		return destinataire;
	}
	public void setDestinataire(String destinataire) {
		this.destinataire = destinataire;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getDateFin() {
		return dateFin;
	}
	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}
	public int getNumeroOrdre() {
		return numeroOrdre;
	}
	public void setNumeroOrdre(int numeroOrdre) {
		this.numeroOrdre = numeroOrdre;
	}
	public Date getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
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
	public String getLibelle() {
		return libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	 
	 
}
