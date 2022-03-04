package ma.learn.quiz.service;

import ma.learn.quiz.bean.TypeTeacher;
import ma.learn.quiz.dao.TypeTeacherDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeTeacherService {
    @Autowired
    private TypeTeacherDao typeTeacherDao;

    public List<TypeTeacher> findAll() {
        return typeTeacherDao.findAll();
    }
}
