package ma.learn.quiz.dao;


import ma.learn.quiz.bean.HomeWork;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface HomeWorkDao extends JpaRepository<HomeWork, Long> {
    Optional<HomeWork> findById(Long id);
    void deleteById(Long id);
    HomeWork findBySectionId(Long id);
}