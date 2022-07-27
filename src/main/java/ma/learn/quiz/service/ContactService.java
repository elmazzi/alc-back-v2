package ma.learn.quiz.service;

import ma.learn.quiz.bean.Contact;
import ma.learn.quiz.dao.ContactDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class ContactService {

    @Autowired
    private ContactDao contactDao;

    public List<Contact> findByEmail(String email) {
        return contactDao.findByEmail(email);
    }

    public List<Contact> findAll() {
        return contactDao.findAll();
    }

    public Contact save(Contact entity) {
        return contactDao.save(entity);
    }

    @Transactional
    public void deleteById(Long aLong) {
        contactDao.deleteById(aLong);
    }
}
