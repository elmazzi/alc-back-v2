package ma.learn.quiz.rest.etudiant;

import ma.learn.quiz.bean.Admin;
import ma.learn.quiz.bean.InviteStudent;
import ma.learn.quiz.service.AdminService;
import ma.learn.quiz.service.InviteStudentService;
import ma.learn.quiz.service.vo.InviteStudentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/etudiant/invitedStudentEtudiant")
public class InvitedStudentEtudiantRest {
    @Autowired
    private InviteStudentService inviteStudentService;

    @GetMapping("/{id}")

    public List<InviteStudent> findInviteStudentByEtudiantId(@PathVariable Long id) {
        return inviteStudentService.findInviteStudentByEtudiantId(id);
    }

    @GetMapping("/emailInvited/{emailInvited}")

    public InviteStudent findInviteStudentByEmailInvited(@PathVariable String emailInvited) {
        return inviteStudentService.findInviteStudentByEmailInvited(emailInvited);
    }

    @PostMapping("/")

    public List<InviteStudent> findAllByCriteria(@RequestBody InviteStudentVo inviteStudentVo) {
        return inviteStudentService.findAllByCriteria(inviteStudentVo);
    }

    @GetMapping("/{idStudent}/{emailInvited}")
    public int saveInvitation(@PathVariable Long idStudent, @PathVariable String emailInvited) {
        return inviteStudentService.saveInvitation(idStudent, emailInvited);
    }
}
