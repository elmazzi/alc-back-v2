package ma.learn.quiz.configuration;

import freemarker.core.ParseException;
import freemarker.template.*;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;
import java.io.IOException;
import java.util.*;

@Service
@AllArgsConstructor
public class EmailSenderService {
    private final Configuration configuration;

    @Async
    public void sentJavaMail(MailComponent mailComponent, String templateName) throws MessagingException, IOException, TemplateException {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("engflexy.contact@gmail.com");
        mailSender.setPassword("phcxgqgzsfkaezhp");
        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");
        props.put("mail.smtp.ssl.enable", false);
        mailSender.setJavaMailProperties(props);
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper mailMessage = new MimeMessageHelper(mimeMessage, "utf-8");
        mailMessage.setFrom("engflexy.contact@gmail.com");
        mailMessage.setTo(mailComponent.getTo());
        mailMessage.setSubject(mailComponent.getSubject());
        Template template = getTemplateByName(templateName);
        String emailContent = fillMailContent(mailComponent, template);
        mailMessage.setText(emailContent, true);
        mailSender.send(mimeMessage);
    }


    public Template getTemplateByName(String templateName)
            throws TemplateNotFoundException, MalformedTemplateNameException, ParseException, IOException {

        Template tempalte = configuration.getTemplate(templateName);
        return tempalte;
    }

    public String fillMailContent(MailComponent mailComponent, Template template)
            throws IOException, TemplateException {

        Map<String, Object> model = new HashMap<>();

        model.put("username", mailComponent.getUsername());
        model.put("password", mailComponent.getPassword());

        String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, model);

        StringBuffer content = new StringBuffer(html);

        return content.toString();
    }


}
