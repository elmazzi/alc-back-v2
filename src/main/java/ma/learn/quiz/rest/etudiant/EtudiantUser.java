package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.User;
import ma.learn.quiz.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.List;

import static ma.learn.quiz.filter.JwtConstant.TEMP_PROFILE_IMAGE_BASE_URL;
import static org.springframework.http.MediaType.IMAGE_JPEG_VALUE;

@RestController
@RequestMapping("/etudiant/user")
public class EtudiantUser {

    @PostMapping("/login")
    public ResponseEntity<User> signIn(@RequestBody User user) {
        System.out.println(user.getPassword());
        System.out.println(user.getUsername());
        return userService.signIn(user);
    }

    @GetMapping("/")
    public List<User> findAll() {
        return userService.findAll();
    }

    @PostMapping("/")
    public User save(@RequestBody  User user) {
        return userService.save(user);
    }

    @Autowired
    private UserServiceImpl userService;
}
