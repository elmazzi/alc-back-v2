package ma.learn.quiz.dao;

import ma.learn.quiz.bean.GroupeEtudiantDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GroupeEtudiantDetailDao extends JpaRepository<GroupeEtudiantDetail,Long> {
    public Optional<GroupeEtudiantDetail> findById(Long id);

    List<GroupeEtudiantDetail>  findByGroupeEtudiantId(Long id);
    //  List<Etudiant> findEtudiantByGroupeEtudeDetail (GroupeEtudeDetail groupeEtudeDetail);
    public int deleteByGroupeEtudiantId(Long id);

}
