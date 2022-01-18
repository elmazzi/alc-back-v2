package ma.learn.quiz;

import miniApp.migration.DataBaseMigration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
class MyConfiguration {
    @Bean
    public DataBaseMigration DataBaseMigration() {
        return new DataBaseMigration();
    }


}
