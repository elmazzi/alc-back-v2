package ma.learn.quiz.dao;

import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.GroupeEtudeDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GroupeEtudeDetailDao extends JpaRepository<GroupeEtudeDetail,Long> {
    public Optional<GroupeEtudeDetail> findById(Long id);
  //  List<Etudiant> findEtudiantByGroupeEtudeDetail (GroupeEtudeDetail groupeEtudeDetail);
}
