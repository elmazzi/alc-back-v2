package ma.learn.quiz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;

import static ma.learn.quiz.filter.JwtConstant.USER_FOLDER;

@SpringBootApplication
public class QuizApplication {

    public static void main(String[] args) {
        SpringApplication.run(QuizApplication.class, args);
        System.out.println("Application run successfully");
        new File(USER_FOLDER).mkdirs();
    }

}
