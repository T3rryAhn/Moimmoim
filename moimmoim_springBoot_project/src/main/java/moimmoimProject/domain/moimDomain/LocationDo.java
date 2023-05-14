package moimmoimProject.domain.moimDomain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LocationDo {

    private int locationNum;
    private String locationName;
    private int frontCode;
    private String destination;

    public LocationDo(){

    }
}
