package ma.learn.quiz.service;


import ma.learn.quiz.bean.TypeHomeWork;
import ma.learn.quiz.dao.TypeHomeWorkDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class TypeHomeWorkService {


    public Optional<TypeHomeWork> findById(Long id) {
        return typeHomeWorkDao.findById(id);
    }

    @Transactional
    public void deleteById(Long id) {
        typeHomeWorkDao.deleteById(id);
    }

    public List<TypeHomeWork> findAll() {
        return typeHomeWorkDao.findAll();
    }

    public int save(TypeHomeWork typeHomeWork) {
        typeHomeWorkDao.save(typeHomeWork);
        return 1;
    }

    @Autowired
    private TypeHomeWorkDao typeHomeWorkDao;
}
