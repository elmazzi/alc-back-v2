package ma.learn.quiz.service;

import ma.learn.quiz.bean.Price;
import ma.learn.quiz.dao.PriceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PriceService {
    @Autowired
    private PriceDao priceDao;

    public List<Price> findAll() {
        return priceDao.findAll();
    }

    public Price  save(Price entity) {
        return priceDao.save(entity);
    }

    public Optional<Price> findById(Long aLong) {
        return priceDao.findById(aLong);
    }
}
