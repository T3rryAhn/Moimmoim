package moimmoimProject.configuration;

import moimmoimProject.repository.*;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@MapperScan(value = {"moimmoimProject.mapper.userMapper"})
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
}
