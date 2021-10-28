package ma.learn.quiz.service.facade;

import ma.learn.quiz.bean.User;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    ResponseEntity<User> signIn(User user);

    User save(User user);
   List<User> findAll();
   String generatePassword();
   void deleteUserById(Long id);
    User updateUser(User user);
}
