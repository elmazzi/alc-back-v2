package ma.learn.quiz.rest.admin;

import ma.learn.quiz.bean.Contact;
import ma.learn.quiz.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@RequestMapping("/admin/contact")
public class ContactRest {

    @Autowired
    private ContactService contactService;

    @GetMapping("/email/{email}")
    public List<Contact> findByEmail(@PathVariable String email) {
        return contactService.findByEmail(email);
    }

    @GetMapping("/")
    public List<Contact> findAll() {
        return contactService.findAll();
    }

    @PostMapping("/")
    public Contact save(@RequestBody Contact entity) {
        return contactService.save(entity);
    }

    @DeleteMapping("/id/{id}")
    public void deleteById(@PathVariable Long id) {
        contactService.deleteById(id);
    }
}
