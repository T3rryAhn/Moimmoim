package moimmoimProject.config;


import moimmoimProject.Repository.JdbcMoimRepository;
import moimmoimProject.Repository.MoimRepository;
import moimmoimProject.service.moimService.MoimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;


@Configuration
public class MoimConfig {

    private DataSource dataSource;
    @Autowired
    public MoimConfig(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Bean
    public MoimRepository moimRepository() {
        return new JdbcMoimRepository(dataSource);
    }

    @Bean
    public MoimService moimService() {
        return new MoimService(moimRepository());
    }

}
