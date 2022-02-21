package ma.learn.quiz.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

import ma.learn.quiz.bean.TypeReclamationEtudiant;


@Repository
public interface TypeReclamationEtudiantDao extends JpaRepository<TypeReclamationEtudiant, Long> {
    TypeReclamationEtudiant findTypeReclamationEtudiantByCode(String code);
    int deleteTypeReclamationEtudiantById(Long id);

}
