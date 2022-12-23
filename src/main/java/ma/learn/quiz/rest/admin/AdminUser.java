package ma.learn.quiz.rest.admin;

import freemarker.template.TemplateException;
import ma.learn.quiz.bean.Prof;
import ma.learn.quiz.bean.User;
import ma.learn.quiz.service.ProfService;
import ma.learn.quiz.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.List;

import static ma.learn.quiz.filter.JwtConstant.TEMP_PROFILE_IMAGE_BASE_URL;
import static org.springframework.http.MediaType.IMAGE_JPEG_VALUE;

@RestController
@RequestMapping("/admin/user")
public class AdminUser {

    @PostMapping("/login")
    public ResponseEntity<User> signIn(@RequestBody User user) {
        return userService.signIn(user);
    }

    @GetMapping("/")
    public List<User> findAll() {
        return userService.findAll();
    }

    @PostMapping("/")
    public User save(@RequestBody  User user) throws MessagingException, IOException, TemplateException {
        return userService.save(user);
    }


    @PostMapping("/allow")
    public Prof allowUser(@RequestBody Prof prof) {
        return profService.allowTeacher(prof);
    }

    @PostMapping("/lock")
    public Prof lockUser(@RequestBody Prof prof) throws MessagingException, TemplateException, IOException {
        return profService.lockTeacher(prof);
    }

    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private ProfService profService;
}
