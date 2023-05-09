package moimmoimProject.mapper;

import lombok.extern.slf4j.Slf4j;
import moimmoimProject.domain.moimDomain.ImageDTO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Slf4j
class MoimMapperTest {

    @Autowired
    private MoimMapper moimMapper;
    @Test
    public void imageEnrollTest() {

        ImageDTO vo = new ImageDTO();

        vo.setMoimNum(1L);
        vo.setFileName("test");
        vo.setUploadPath("test");
        vo.setUuid("test2");

        moimMapper.imageEnroll(vo);
    }

}