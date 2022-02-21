package ma.learn.quiz.bean;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
public class Etudiant extends User {
    private String ref;
    private String teacherLocality; //  native || non-native
    private String groupOption;

    @ManyToOne
    private EtatEtudiantSchedule etatEtudiantSchedule;
    @ManyToOne
    private Parcours parcours;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "etudiant")
    private List<QuizEtudiant> quizEtudiant;
    @ManyToOne
    private GroupeEtude groupeEtude;
    @OneToMany(mappedBy = "etudiant")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private List<GroupeEtudiantDetail> groupeEtudiantDetails;
    @ManyToOne
    private PackStudent packStudent;
    @ManyToOne
    private StatutSocial statutSocial;
    @ManyToOne
    private InteretEtudiant interetEtudiant;
    @ManyToOne
    private NiveauEtude niveauEtude;
    @ManyToOne
    private Skill skill;
    @ManyToOne
    private  Fonction fonction;

    private String langue;




    public Etudiant(User user, String ref, Prof prof, EtatEtudiantSchedule etatEtudiantSchedule, Parcours parcours, List<QuizEtudiant> quizEtudiant) {
        super(user.id, user.username, user.password, user.nom, user.prenom,
                user.numero, user.addresse,user.dateNaissance,user.country, user.ville, user.age, user.image, user.accountNonExpired,
                user.credentialsNonExpired, user.accountNonLocked, user.enabled, user.authorities, user.role);
        this.ref = ref;
        this.etatEtudiantSchedule = etatEtudiantSchedule;
        this.parcours = parcours;
        this.quizEtudiant = quizEtudiant;
    }

    public Etudiant(User user) {
        super(user.id, user.username, user.password, user.nom, user.prenom,
                user.numero, user.addresse,user.dateNaissance, user.country, user.ville, user.age, user.image, user.accountNonExpired,
                user.credentialsNonExpired, user.accountNonLocked, user.enabled, user.authorities, user.role);    }

    public Etudiant() {
    }

    public String getLangue() {
        return langue;
    }

    public void setLangue(String langue) {
        this.langue = langue;
    }

    public Skill getSkill() {
        return skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public StatutSocial getStatutSocial() {
        return statutSocial;
    }

    public void setStatutSocial(StatutSocial statutSocial) {
        this.statutSocial = statutSocial;
    }

    public InteretEtudiant getInteretEtudiant() {
        return interetEtudiant;
    }

    public void setInteretEtudiant(InteretEtudiant interetEtudiant) {
        this.interetEtudiant = interetEtudiant;
    }

    public NiveauEtude getNiveauEtude() {
        return niveauEtude;
    }

    public void setNiveauEtude(NiveauEtude niveauEtude) {
        this.niveauEtude = niveauEtude;
    }

    public Fonction getFonction() {
        return fonction;
    }

    public void setFonction(Fonction fonction) {
        this.fonction = fonction;
    }

    public PackStudent getPackStudent() {
        return packStudent;
    }

    public void setPackStudent(PackStudent packStudent) {
        this.packStudent = packStudent;
    }

    public GroupeEtude getGroupeEtude() {
        return groupeEtude;
    }

    public void setGroupeEtude(GroupeEtude groupeEtude) {
        this.groupeEtude = groupeEtude;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public List<GroupeEtudiantDetail> getGroupeEtudiantDetails() {
        return groupeEtudiantDetails;
    }

    public void setGroupeEtudiantDetails(List<GroupeEtudiantDetail> groupeEtudiantDetails) {
        this.groupeEtudiantDetails = groupeEtudiantDetails;
    }

    public Etudiant(String ref, String nom, String prenom, int age, String username, String ville, String address, String password, String image, String gmail, Prof prof, EtatEtudiantSchedule etatEtudiantSchedule, Parcours parcours, List<QuizEtudiant> quizEtudiant) {
        this.ref = ref;
        this.nom = nom;
        this.prenom = prenom;
        this.age = age;
        this.username = username;
        this.ville = ville;
        this.password = password;
        this.etatEtudiantSchedule = etatEtudiantSchedule;
        this.parcours = parcours;
        this.quizEtudiant = quizEtudiant;
    }


    public List<QuizEtudiant> getQuizEtudiant() {
        return quizEtudiant;
    }

    public void setQuizEtudiant(List<QuizEtudiant> quizEtudiant) {
        this.quizEtudiant = quizEtudiant;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTeacherLocality() {
        return teacherLocality;
    }

    public void setTeacherLocality(String teacherLocality) {
        this.teacherLocality = teacherLocality;
    }

    public String getGroupOption() {
        return groupOption;
    }

    public void setGroupOption(String groupOption) {
        this.groupOption = groupOption;
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

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
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

    public Parcours getParcours() {
        return parcours;
    }

    public void setParcours(Parcours parcours) {
        this.parcours = parcours;
    }

    public EtatEtudiantSchedule getEtatEtudiantSchedule() {
        return etatEtudiantSchedule;
    }

    public void setEtatEtudiantSchedule(EtatEtudiantSchedule etatEtudiantSchedule) {
        this.etatEtudiantSchedule = etatEtudiantSchedule;
    }

}