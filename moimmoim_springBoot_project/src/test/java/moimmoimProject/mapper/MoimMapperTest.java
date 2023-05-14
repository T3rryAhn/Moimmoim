package moimmoimProject.mapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import moimmoimProject.domain.moimDomain.MoimDo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Slf4j
@RequiredArgsConstructor
class MoimMapperTest {

    @Autowired
    private MoimMapper moimMapper;

    @Test
    void test(){
        Long a = 1L;
        MoimDo b = new MoimDo();
        b.setMoimNum(1L);
        b.setMoimHostUserIdNum(1L);
        System.out.println(b.getMoimNum());
        System.out.println(b.getMoimHostUserIdNum());
        moimMapper.joinMoim(a,b);
    }
}