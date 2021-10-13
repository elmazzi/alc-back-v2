package ma.learn.quiz.dao;

import ma.learn.quiz.bean.GroupeEtude;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface GroupeEtudeDao extends JpaRepository<GroupeEtude,Long> {
    public Optional<GroupeEtude> findById(Long id);
    public GroupeEtude findByLibelle(String libelle);
    public int deleteByLibelle(String libelle);

}
