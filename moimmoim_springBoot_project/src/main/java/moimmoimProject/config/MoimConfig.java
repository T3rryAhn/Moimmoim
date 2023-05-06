package moimmoimProject.config;


import lombok.AllArgsConstructor;
import moimmoimProject.mapper.MoimMapper;
import moimmoimProject.repository.JdbcMoimRepository;
import moimmoimProject.repository.MoimRepository;
import moimmoimProject.repository.MybatisMoimRepository;
import moimmoimProject.service.moimService.MoimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;


@Configuration
@AllArgsConstructor
public class MoimConfig {

    private final DataSource dataSource;
    private final MoimMapper moimMapper;

    /*@Bean
    public MoimRepository moimRepository() {
        return new MybatisMoimRepository(moimMapper);
    }

    @Bean
    public MoimService moimService() {
        return new MoimService(moimRepository());
    }
*/
}
