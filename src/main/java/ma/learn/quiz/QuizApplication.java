package ma.learn.quiz;

import ma.learn.quiz.bean.TypeDeQuestion;
import ma.learn.quiz.dao.TypeDeQuestionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Configuration;

import java.io.File;

import static ma.learn.quiz.filter.JwtConstant.USER_FOLDER;

@SpringBootApplication
public class QuizApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(QuizApplication.class, args);
        new File(USER_FOLDER).mkdirs();

    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(QuizApplication.class);
    }
}
