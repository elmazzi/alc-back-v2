package ma.learn.quiz.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ma.learn.quiz.bean.Question;

import java.util.List;
import java.util.Optional;

@Repository
public interface QuestionDao extends JpaRepository<Question, Long> {
    Question findByRef(String ref);
    Question findByNumero(Long numero);
    Optional<Question> findById(Long id);
    List<Question> findByQuizRef(String ref);
    int deleteByQuizRef(String ref);
    int deleteByRef(String ref);
    int deleteByNumero(Long numero);
    void deleteById(Long id);
    Question findQuestionById(Long Id);

    void deleteAllByQuizId(Long id);
}