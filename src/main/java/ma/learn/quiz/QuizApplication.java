package ma.learn.quiz;

import ma.learn.quiz.bean.TypeDeQuestion;
import ma.learn.quiz.dao.TypeDeQuestionDao;
import org.apache.http.client.HttpClient;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContextBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.SSLContext;
import java.io.File;
import java.security.KeyStore;

import static ma.learn.quiz.filter.JwtConstant.RECLAMATION_FOLDER;
import static ma.learn.quiz.filter.JwtConstant.USER_FOLDER;

@SpringBootApplication
public class QuizApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(QuizApplication.class, args);
        new File(USER_FOLDER).mkdirs();
        new File(RECLAMATION_FOLDER).mkdirs();

    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(QuizApplication.class);
    }


}
