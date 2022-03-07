package ma.learn.quiz.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.learn.quiz.bean.Reponse;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReponseDao extends JpaRepository<Reponse, Long> {
    Reponse findByRef(String ref);
    Reponse findReponseById(Long id);

    List<Reponse> findByQuestionId(Long id);
    
    List<Reponse> findByQuestionNumero(Long numero);

    List<Reponse> findByEtatReponse(String etatReponse);
    
    
    int deleteByQuestionRef(String ref);

    int deleteByQuestionId(Long id);

    @Transactional
    int deleteByQuestionQuizRef(String ref);

    int deleteByRef(String ref);
    @Transactional
    void deleteById(Long id);

    Optional<Reponse> findById(Long id);

    void deleteAllByQuestionId(Long id);
}
