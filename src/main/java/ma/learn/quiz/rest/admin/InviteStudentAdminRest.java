package ma.learn.quiz.rest.admin;

import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeRequestUrl;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.DriveScopes;
import ma.learn.quiz.bean.Admin;
import ma.learn.quiz.bean.InviteStudent;
import ma.learn.quiz.service.AdminService;
import ma.learn.quiz.service.InviteStudentService;
import ma.learn.quiz.service.vo.InviteStudentVo;
import miniApp.migration.DataBaseMigration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("/admin/inviteStudentAdmin")
public class InviteStudentAdminRest {
    @Autowired
    private InviteStudentService inviteStudentService;

    @GetMapping("/")
    public List<InviteStudent> findAll() {
        return inviteStudentService.findAll();
    }
    @PostMapping("/")

    public List<InviteStudent> findAllByCriteria(@RequestBody InviteStudentVo inviteStudentVo) {
        return inviteStudentService.findAllByCriteria(inviteStudentVo);
    }
}
