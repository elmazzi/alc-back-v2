package ma.learn.quiz.bean;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.lang.Nullable;

@Entity
public class Prof extends User {
    private String ref;
    @Column(length = 512)
    private String about;
    @Column(length = 512)
    private String token;


    @OneToOne
    @Nullable
    Parcours levelMin;
    @OneToOne
    @Nullable
    Parcours levelMax;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "prof")
    List<TrancheHoraireProf> trancheHoraireProfList = new ArrayList<>();
    @ManyToOne
    private CategorieProf categorieProf;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "responsable")
    private List<ClassRoom> classRooms;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @OneToMany(mappedBy = "prof")
    private List<RecommendTeacher> recommendTeacher;
@ManyToOne
private TypeTeacher typeTeacher;

    public Prof() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Prof(User user , String ref, CategorieProf categorieProf, List<ClassRoom> classRooms, List<RecommendTeacher> recommendTeacher, List<Etudiant> etudiantList) {
        super(user.id, user.username, user.password, user.nom, user.prenom,
                user.numero, user.addresse,user.dateNaissance, user.country, user.ville, user.age, user.image, user.accountNonExpired,
                user.credentialsNonExpired, user.accountNonLocked, user.enabled, user.authorities, user.role, user.skype);
        this.ref = ref;
        this.categorieProf = categorieProf;
        this.classRooms = classRooms;
        this.recommendTeacher = recommendTeacher;
    }

    public Prof(User user) {
        super(user.id, user.username, user.password, user.nom, user.prenom,
                user.numero, user.addresse,user.dateNaissance, user.country, user.ville, user.age, user.image, user.accountNonExpired,
                user.credentialsNonExpired, user.accountNonLocked, user.enabled, user.authorities, user.role, user.skype);
    }

    public Prof(String username, String password) {
        super(username, password);
    }


    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getAddresse() {
        return addresse;
    }


    public void setAddresse(String addresse) {
        this.addresse = addresse;
    }


    public List<RecommendTeacher> getRecommendTeacher() {
        return recommendTeacher;
    }

    public void setRecommendTeacher(List<RecommendTeacher> recommendTeacher) {
        this.recommendTeacher = recommendTeacher;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
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

    public List<ClassRoom> getClassRooms() {
        return classRooms;
    }

    public void setClassRooms(List<ClassRoom> classRooms) {
        this.classRooms = classRooms;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public Long getId() {
        return id;
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


    public CategorieProf getCategorieProf() {
        return categorieProf;
    }

    public void setCategorieProf(CategorieProf categorieProf) {
        this.categorieProf = categorieProf;
    }

    public Parcours getLevelMin() {
        return levelMin;
    }

    public void setLevelMin(Parcours levelMin) {
        this.levelMin = levelMin;
    }

    public Parcours getLevelMax() {
        return levelMax;
    }

    public void setLevelMax(Parcours levelMax) {
        this.levelMax = levelMax;
    }

    public List<TrancheHoraireProf> getTrancheHoraireProfList() {
        return trancheHoraireProfList;
    }

    public void setTrancheHoraireProfList(List<TrancheHoraireProf> trancheHoraireProfList) {
        this.trancheHoraireProfList = trancheHoraireProfList;
    }

    public TypeTeacher getTypeTeacher() {
        return typeTeacher;
    }

    public void setTypeTeacher(TypeTeacher typeTeacher) {
        this.typeTeacher = typeTeacher;
    }
}
