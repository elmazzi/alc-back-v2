package ma.learn.quiz.dao;

import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.GroupeEtude;
import ma.learn.quiz.bean.GroupeEtudiant;
import ma.learn.quiz.bean.GroupeEtudiantDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GroupeEtudiantDao extends JpaRepository<GroupeEtudiant, Long> {
    public GroupeEtudiant findGroupeEtudiantById(Long id);

    public GroupeEtudiant findByLibelle(String libelle);

    public int deleteGroupeEtudiantById(Long id);

    List<GroupeEtudiant> findByParcoursIdAndNombrePlacevideGreaterThan(Long id, Long nombrePlacevide);

    List<GroupeEtudiant> findGroupeEtudiantByProfId(Long idprof);
}
