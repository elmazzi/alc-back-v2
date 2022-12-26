package ma.learn.quiz.dao;

import ma.learn.quiz.bean.Price;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PriceDao extends JpaRepository<Price,Long> {
}
