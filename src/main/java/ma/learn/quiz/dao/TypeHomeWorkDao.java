package ma.learn.quiz.dao;


import ma.learn.quiz.bean.TypeHomeWork;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TypeHomeWorkDao extends JpaRepository<TypeHomeWork, Long> {
    Optional<TypeHomeWork> findById(Long id);
    void deleteById(Long id);
    TypeHomeWork findByLib(String lib);
}