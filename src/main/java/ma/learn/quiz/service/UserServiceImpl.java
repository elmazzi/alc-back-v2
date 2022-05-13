package ma.learn.quiz.service;


import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.User;
import ma.learn.quiz.dao.EtudiantDao;
import ma.learn.quiz.dao.UserDao;
import ma.learn.quiz.exception.NotAnImageFileException;
import ma.learn.quiz.filter.RoleConstant;
import ma.learn.quiz.service.facade.RoleService;
import ma.learn.quiz.service.facade.UserService;
import ma.learn.quiz.util.JwtUtil;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.persistence.EntityManager;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;
import static ma.learn.quiz.filter.JwtConstant.*;
import static ma.learn.quiz.filter.JwtConstant.JWT_TOKEN_HEADER;
import static org.springframework.http.HttpStatus.OK;
import static org.springframework.http.MediaType.*;

@Service
public class UserServiceImpl implements UserService {

    public Map<Long, User> connectedStudent = new HashMap<>();
    private Logger LOGGER = LoggerFactory.getLogger(getClass());
    @Autowired
    public JavaMailSender mailSender;
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private JwtUtil jwtUtil;
    @Autowired
    private EtudiantDao etudiantDao;


    @Override
    public ResponseEntity<User> signIn(User user) {
        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                    user.getUsername(), user.getPassword()
            ));
        } catch (BadCredentialsException e) {
            throw new BadCredentialsException("bad credited for username " + user.getUsername());
        }
        User loadUserByUsername = loadUserByUsername(user.getUsername());
        HttpHeaders jwtHeader = getJwtHeader(user);

        if (loadUserByUsername.getRole().equals("STUDENT")) {
            this.connectedStudent.put(loadUserByUsername.getId(), loadUserByUsername);
        }
        return new ResponseEntity<>(loadUserByUsername, jwtHeader, OK);
    }

    private HttpHeaders getJwtHeader(User user) {
        HttpHeaders headers = new HttpHeaders();
        headers.add(JWT_TOKEN_HEADER, jwtUtil.generateToken(user));
        return headers;
    }

    @Override
    public User save(User user) {
        System.out.println(user.getUsername());
        System.out.println(user.getPassword());
        System.out.println(user.getAuthorities());
        User loadedUser = userDao.findByUsername(user.getUsername());
        if (loadedUser != null)
            return null;
        else {
            prepareMessage(user);
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setImage(getTemporaryProfileImageUrl(user.getUsername()));
            roleService.save(user.getAuthorities());
            return userDao.save(user);
        }
    }

    public void prepareMessage(User user) {
        System.out.println("prepare email ");
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(this.ENG_FLEXY_EMAIL);
        message.setTo(user.getUsername());
        message.setSubject("accepted on the platform e-learning");
        message.setText("Your online registration on the site: https://engflexy.com is validated. \n" + "You can log into your account now.\n" +
                "Your account settings are :" + "\n" +
                "username : " + user.getUsername() + "\n" +
                "password : " + user.getPassword());
        mailSender.send(message);
        System.out.println("email send");

    }

    private String setProfileImageUrl(String username) {
        return ServletUriComponentsBuilder.fromCurrentContextPath().path(USER_IMAGE_PATH + username +
                FORWARD_SLASH + username + DOT + JPG_EXTENSION).toUriString();
    }


    private String getTemporaryProfileImageUrl(String username) {
        return ServletUriComponentsBuilder.fromCurrentContextPath().path(DEFAULT_USER_IMAGE_PATH + username)
                .toUriString();
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.findByUsername(username);
        if (user == null || user.getId() == null) {
            throw new UsernameNotFoundException("user " + username + " not founded");
        } else {
            return user;
        }
    }


    private void saveProfileImage(User user, MultipartFile profileImage) throws IOException, NotAnImageFileException {

        System.out.println(user.getUsername());
        if (profileImage != null) {
            if (!Arrays.asList(IMAGE_JPEG_VALUE, IMAGE_PNG_VALUE, IMAGE_GIF_VALUE).contains(profileImage.getContentType())) {
                throw new NotAnImageFileException(profileImage.getOriginalFilename() + NOT_AN_IMAGE_FILE);
            }
            Path userFolder = Paths.get(USER_FOLDER + user.getUsername()).toAbsolutePath().normalize();
            if (!Files.exists(userFolder)) {
                Files.createDirectories(userFolder);
                LOGGER.info(DIRECTORY_CREATED + userFolder);
            }
            Files.deleteIfExists(Paths.get(userFolder + user.getUsername() + DOT + JPG_EXTENSION));
            Files.copy(profileImage.getInputStream(), userFolder.resolve(user.getUsername() + DOT + JPG_EXTENSION), REPLACE_EXISTING);
            user.setImage(setProfileImageUrl(user.getUsername()));
            this.userDao.save(user);
            LOGGER.info(FILE_SAVED_IN_FILE_SYSTEM + profileImage.getOriginalFilename());
        }
    }

    @Override
    public String generatePassword() {
        return RandomStringUtils.randomAlphanumeric(10);
    }

    @Override
    public void deleteUserById(Long id) {
        userDao.deleteById(id);
    }

    @Override
    public User updateUser(User user) {
        System.out.println(user.getId());
        User localUser = loadUserByUsername(user.getUsername());
        localUser.setAddresse(user.getAddresse());
        localUser.setAge(user.getAge());
        localUser.setNom(user.getNom());
        localUser.setNumero(user.getNumero());
        localUser.setPrenom(user.getPrenom());
        localUser.setVille(user.getVille());
        localUser.setSkype(user.getSkype());
        return userDao.save(localUser);
    }

    public User updateProfileImage(String username, MultipartFile profileImage) throws IOException, NotAnImageFileException {
        User user = this.loadUserByUsername(username);
        saveProfileImage(user, profileImage);
        return user;
    }


    public String resetPassword(String username) {
        User user = this.loadUserByUsername(username);
        if (user == null) {
            return "User not found !";
        } else {
            String password = this.generatePassword();
            user.setPassword(password);
            System.out.println(user.getPassword());
            System.out.println(user.getUsername());
            this.prepareMessage(user);
            user.setPassword(passwordEncoder.encode(password));
            userDao.save(user);
            return password;
        }
    }


    @Value("${spring.mail.username}")
    private String ENG_FLEXY_EMAIL;

}
