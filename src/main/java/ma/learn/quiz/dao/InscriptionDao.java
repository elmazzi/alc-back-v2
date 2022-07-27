package ma.learn.quiz.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import ma.learn.quiz.bean.Inscription;

public interface InscriptionDao extends JpaRepository<Inscription, Long> {
    Inscription findByNumeroInscription(int numeroInscription);

    Inscription findInscriptionByEtudiantId(Long id);

    List<Inscription> findByDateRegistration(String dateRegistration);

    int deleteByNumeroInscription(int numeroInscription);

    int deleteByEtatInscriptionRef(String ref);

    int deleteByEtudiantRef(String ref);

    int deleteInscriptionById(Long id);

    int deleteInscriptionByEtudiantId(Long id);

    List<Inscription> findInscriptionsByEtudiantId(Long id);

    Inscription findInscriptionById(Long id);

    Inscription findInscriptionByEtudiantUsername(String username);

    List<Inscription> findAllByOrderByIdDesc();

    List<Inscription> findAllByEtatInscriptionLibelleOrderByIdDesc(String libelle);
}
