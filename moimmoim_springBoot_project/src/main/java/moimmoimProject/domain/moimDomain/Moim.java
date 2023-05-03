package moimmoimProject.domain.moimDomain;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class Moim {
    private long moim_num;
    private long user_num;
    private String moim_title;
    private String moim_main;
    private String moim_pictures;

    @DateTimeFormat(pattern = "YY/MM/DD/HH/MM/SS")
    private Date moim_create_date;

    private int moim_views;
    private int category_num;

    @DateTimeFormat(pattern = "YY/MM/DD/HH/MM/SS")
    private Date moim_start_time;

    @DateTimeFormat(pattern = "YY/MM/DD/HH/MM/SS")
    private Date moim_end_time;

    private int moim_member_count;
    private int moim_member_max;
    private int moim_price;

    @DateTimeFormat(pattern = "YY/MM/DD/HH/MM/SS")
    private Date moim_date_join;

    @DateTimeFormat(pattern = "YY/MM/DD/HH/MM/SS")
    private Date moim_deadline;

    private Boolean moim_dead_check;
    private int Location_num;

    public Moim(){
    }
}
