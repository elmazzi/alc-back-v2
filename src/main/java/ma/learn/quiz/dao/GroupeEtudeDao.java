package ma.learn.quiz.dao;

import ma.learn.quiz.bean.GroupeEtude;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupeEtudeDao extends JpaRepository<GroupeEtude,Long> {
    GroupeEtude findGroupeEtudeById(Long id);
    public GroupeEtude findByLibelle(String libelle);
    public int deleteByLibelle(String libelle);
    public int deleteGroupeEtudeById(Long id );
}
