package moimmoimProject.domain.review;

import lombok.Data;

@Data
public class Review {
    private int review_num;
    private int userid_num;
    private int emoim_num;
    private int star;
    private int content;
    private int title;
    private int created_date;
}
