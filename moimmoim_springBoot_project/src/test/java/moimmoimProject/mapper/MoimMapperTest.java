package moimmoimProject.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MoimMapperTest {

    @Autowired
    private MoimMapper moimMapper;

    @Test
    void abc(){
        String keyword = "ads";
        Long a = 7L;
        moimMapper.findAllex(keyword,a);
        System.out.println();
    }
}