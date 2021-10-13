package ma.learn.quiz.dao;

import ma.learn.quiz.bean.GroupeEtude;
import ma.learn.quiz.bean.GroupeEtudiant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface GroupeEtudiantDao extends JpaRepository<GroupeEtudiant,Long> {
    public Optional<GroupeEtudiant> findById(Long id);
    public GroupeEtudiant findByLibelle(String libelle);
    public int deleteByLibelle(String libelle);
}
