package ma.learn.quiz.bean;


	import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

	@Entity
	public class Inscription  {
		   @Id
		    @GeneratedValue(strategy = GenerationType.AUTO)
		    private Long id ;
			private String ref;
			private String nom;
			private String prenom;
			private String numero;
			private int age;
			private String login;
			private String ville;
			private String address;
			private String password;
			private String image;
		    private String gmail;
			@ManyToOne
			private EtatInscription etatInscription;
			@ManyToOne
			private Prof prof;

			@ManyToOne
			private Parcours parcours;
			
		    private int numeroInscription;
		    @Temporal (TemporalType.DATE)
		   private Date datedebutinscription;
		    @Temporal (TemporalType.DATE)
			   private Date datefininscription;
		    


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

		public String getNumero() {
			return numero;
		}

		public void setNumero(String numero) {
			this.numero = numero;
		}

		public String getGmail() {
			return gmail;
		}

		public void setGmail(String gmail) {
			this.gmail = gmail;
		}

		public int getNumeroInscription() {
				return numeroInscription;
			}
			public void setNumeroInscription(int numeroInscription) {
				this.numeroInscription = numeroInscription;
			}
			
			public Date getDatedebutinscription() {
				return datedebutinscription;
			}
			public void setDatedebutinscription(Date datedebutinscription) {
				this.datedebutinscription = datedebutinscription;
			}
			public Date getDatefininscription() {
				return datefininscription;
			}
			public void setDatefininscription(Date datefininscription) {
				this.datefininscription = datefininscription;
			}
			public EtatInscription getEtatInscription() {
				return etatInscription;
			}
			public void setEtatInscription(EtatInscription etatInscription) {
				this.etatInscription = etatInscription;
			}
			public String getRef() {
				return ref;
			}
			public void setRef(String ref) {
				this.ref = ref;
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
			public int getAge() {
				return age;
			}
			public void setAge(int age) {
				this.age = age;
			}
			public String getLogin() {
				return login;
			}
			public void setLogin(String login) {
				this.login = login;
			}
			public String getVille() {
				return ville;
			}
			public void setVille(String ville) {
				this.ville = ville;
			}
			public String getAddress() {
				return address;
			}
			public void setAddress(String address) {
				this.address = address;
			}
			public String getPassword() {
				return password;
			}
			public void setPassword(String password) {
				this.password = password;
			}
			public String getImage() {
				return image;
			}
			public void setImage(String image) {
				this.image = image;
			}
			public Parcours getParcours() {
				return parcours;
			}
			public void setParcours(Parcours parcours) {
				this.parcours = parcours;
			}
			
			
			
			
			
			
		
			
			
		   

	}



