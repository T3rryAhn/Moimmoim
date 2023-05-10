package moimmoimProject.mapper;

import lombok.extern.slf4j.Slf4j;
import moimmoimProject.domain.moimDomain.LocationDo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class moimMapperTest {

    @Autowired
    private MoimMapper moimMapper;
    @Test
    void MoimMapperTest(){
        LocationDo loc = moimMapper.locList1().get(0);

        System.out.println(loc.getDestination());
    }

}