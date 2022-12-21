package ma.learn.quiz.service;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import ma.learn.quiz.bean.*;
import ma.learn.quiz.filter.RoleConstant;
import ma.learn.quiz.service.facade.RoleService;
import ma.learn.quiz.service.facade.UserService;
import ma.learn.quiz.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import ma.learn.quiz.dao.ProfDao;
import ma.learn.quiz.bean.Salary;

import static ma.learn.quiz.filter.JwtConstant.JWT_TOKEN_HEADER;
import static ma.learn.quiz.filter.RoleConstant.ROLE_PROF;
import static org.springframework.http.HttpStatus.OK;

@Service
public class ProfService extends AbstractService{


    public List<Prof> findByCriteria(Prof prof) {
        String query = this.init("Prof");
        if (prof!= null) {
            if(prof.getNom() != null){
                query += this.addCriteria("nom", prof.getNom(), "LIKE");
            }
            if(prof.getPrenom() != null){
                query += this.addCriteria("prenom", prof.getPrenom(), "LIKE");
            }
            if(prof.getUsername() != null){
                query += this.addCriteria("username", prof.getUsername(), "LIKE");
            }
        }
        System.out.println("query = " + query);
        System.out.println(entityManager.createQuery(query).getResultList().size());
        return entityManager.createQuery(query).getResultList();
    }

    public EtudiantCours findProfByEtuID(Long id, Long idcours) {

        String query = "SELECT e FROM EtudiantCours e WHERE e.etudiant.id=" + id + "AND e.cours.id=" + idcours;

        return (EtudiantCours) entityManager.createQuery(query).getSingleResult();
    }

    public Prof findByNumero(String ref) {
        return profDao.findByNumero(ref);
    }

    public int deleteByNumero(String ref) {
        return profDao.deleteByNumero(ref);
    }

    public Prof findByLogin(String login) {
        return profDao.findByUsername(login);
    }

    public Prof findProfById(Long id) {
        return profDao.findProfById(id);
    }

    public List<Prof> findAll() {
        return profDao.findAll();
    }

    public Prof update(Prof prof) {
        Prof profLoaded = findProfById(prof.getId());
        profLoaded.setLevelMax(prof.getLevelMax());
        profLoaded.setLevelMin(prof.getLevelMin());
        profLoaded.setTypeTeacher(prof.getTypeTeacher());
         trancheHoraireProfService.save(prof ,prof.getTrancheHoraireProfList());
        return profDao.save(profLoaded);
    }

    public Prof save(Prof prof) throws Exception {
        if (findProfById(prof.getId()) != null) {
            throw new Exception("User already exist");
        }
        if (findByLogin(prof.getUsername()) != null) {
            throw new Exception("Email already exist");
        } else {
            String password = this.userService.generatePassword();
            prof.setPassword(this.passwordEncoder.encode(password));
            Role role = this.roleService.findByAuthority(ROLE_PROF);
            prof.setAuthorities(Arrays.asList(role));
            prof.setRole(RoleConstant.ROLE_PROF);
            prof.setEnabled(false);
            prof.setImage(this.userServiceImpl.getTemporaryProfileImageUrl(prof.getUsername()));
           Prof loadUser =  profDao.save(prof);
            String token = jwtUtil.generateToken(loadUser);
            loadUser.setToken(token);
            return loadUser;
        }
    }

    public List<SessionCours> calcStatistique(Salary salaryVo) {
        String query = "SELECT Count(s.id) From SessionCours s where s.dateFin = '" + salaryVo.getAnnee() + "/" + salaryVo.getMois() + "/01'";
        return entityManager.createQuery(query).getResultList();
    }

    public Prof findByRef(String ref) {
        return profDao.findByRef(ref);
    }

    public int deleteByRef(String ref) {
        return profDao.deleteByRef(ref);
    }

    @Transactional
    public int deleteProfById(List<Prof> prof) {
        int res = 0;
        for (int i = 0; i < prof.size(); i++) {
            res += deleteProfById(prof.get(i).getId());
        }
        return res;
    }

    @Transactional
    public int deleteProfById(Long id) {
        return profDao.deleteProfById(id);
    }

    public Prof findByNom(String nom) {
        return profDao.findByNom(nom);
    }

    public Object findByCritere(String login, String password) {
        String query = "SELECT p FROM Prof p WHERE p.username= '" + login + "' and p.password='" + password + "'";
        return entityManager.createQuery(query).getSingleResult();
    }



    public List<SessionCours> findSessionsNonPayer(Long idProf) {
        String query = "SELECT s From SessionCours s where s.payer = 'false' and s.prof.id = '" + idProf + "'";
        return entityManager.createQuery(query).getResultList();
    }

    @Autowired
    public EntityManager entityManager;
    @Autowired
    private ProfDao profDao;
    @Autowired
    private SessionCoursService sessionCoursService;
    @Autowired
    private UserService userService;
    @Autowired
    private UserServiceImpl userServiceImpl;
    @Autowired
    private RoleService roleService;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private JwtUtil jwtUtil;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private TrancheHoraireProfService trancheHoraireProfService;
}