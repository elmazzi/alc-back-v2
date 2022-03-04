package ma.learn.quiz.service;

import ma.learn.quiz.bean.Etudiant;
import ma.learn.quiz.bean.InviteStudent;
import ma.learn.quiz.bean.ReclamationProf;
import ma.learn.quiz.bean.User;
import ma.learn.quiz.dao.InviteStudentdDao;
import ma.learn.quiz.dao.UserDao;
import ma.learn.quiz.service.facade.UserService;
import ma.learn.quiz.service.vo.InviteStudentVo;
import ma.learn.quiz.service.vo.ReclamationProfVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.Date;
import java.util.List;

import static ma.learn.quiz.service.Util.UtilString.generateStringNumber;

@Service
public class InviteStudentService extends AbstractService {
    @Autowired
    private InviteStudentdDao inviteStudentdDao;
    @Autowired
    private EtudiantService etudiantService;
    @Autowired
    private UserService userService;
    @Autowired
    private UserDao userDao;
    @Autowired
    public EntityManager entityManager;

    public List<InviteStudent> findInviteStudentByEtudiantId(Long id) {
        return inviteStudentdDao.findInviteStudentByEtudiantId(id);
    }

    public InviteStudent findInviteStudentByEmailInvited(String emailInvited) {
        return inviteStudentdDao.findInviteStudentByEmailInvited(emailInvited);
    }

    public List<InviteStudent> findAll() {
        return inviteStudentdDao.findAll();
    }

    public List<InviteStudent> findAllByCriteria(InviteStudentVo inviteStudentVo) {
        String query = this.init("InviteStudent");

        if (inviteStudentVo.getCode() != null) {
            query += this.addCriteria("code", inviteStudentVo.getCode(), "LIKE");
        }
        if (inviteStudentVo.getEtudiant() != null) {
            query += this.addCriteria("etudiant.nom", inviteStudentVo.getEtudiant(), "LIKE");
        }
        if (inviteStudentVo.getEmailInvited() != null) {
            query += this.addCriteria("emailInvited", inviteStudentVo.getEmailInvited(), "LIKE");
        }
        if (inviteStudentVo.getDateSentInvitation() != null) {
            query += this.addCriteria("dateSentInvitation", inviteStudentVo.getDateSentInvitation(), "LIKE");
        }

        if (inviteStudentVo.getIsAccepted() != null) {
            query += this.addCriteria("isAccepted", inviteStudentVo.getIsAccepted());
        }
        if (inviteStudentVo.getIsPaidPack() != null) {
            query += this.addCriteria("isPaidPack", inviteStudentVo.getIsPaidPack());
        }


        System.out.println("query = " + query);
        return entityManager.createQuery(query).getResultList();
    }

    public int saveInvitation(Long idStudent, String emailInvited) {
        Etudiant etudiant = etudiantService.findEtudiantById(idStudent);
        User userInvited = userDao.findByUsername(emailInvited);
        if (etudiant == null) {
            return -1;
        } else {
            if (userInvited != null) {
                return -2;
            } else {
                InviteStudent inviteStudent=new InviteStudent();
                inviteStudent.setDateSentInvitation(new Date());
                inviteStudent.setAccepted(false);
                inviteStudent.setCode(generateStringNumber(8));
                inviteStudent.setPaidPack(false);
                inviteStudent.setEmailInvited(emailInvited);
                inviteStudent.setEtudiant(etudiant);
                inviteStudentdDao.save(inviteStudent);
                return 1;
            }
        }
    }

}
