package ma.learn.quiz.bean;
import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class GroupeEtudeDetail implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private GroupeEtudiant groupeEtudiant;
    @ManyToOne
    private GroupeEtude groupeEtude;
/*
   @OneToMany(mappedBy = "groupeEtudiant")
    private List<Etudiant> etudiants;

    public List<Etudiant> getEtudiants() {
        return etudiants;
    }

    public void setEtudiants(List<Etudiant> etudiants) {
        this.etudiants = etudiants;
    }


 */

    public GroupeEtude getGroupeEtude() {
        return groupeEtude;
    }
    public void setGroupeEtude(GroupeEtude groupeEtude) {
        this.groupeEtude = groupeEtude;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public void setGrpEtudiant(GroupeEtudiant groupeEtudiant) {
        this.groupeEtudiant = groupeEtudiant;
    }
    public Long getId() {
        return id;
    }
    public GroupeEtudiant getGrpEtudiant() {
        return groupeEtudiant;
    }
    public GroupeEtudiant getGroupeEtudiant() {
        return groupeEtudiant;
    }
    public void setGroupeEtudiant(GroupeEtudiant groupeEtudiant) {
        this.groupeEtudiant = groupeEtudiant;
    }

}
