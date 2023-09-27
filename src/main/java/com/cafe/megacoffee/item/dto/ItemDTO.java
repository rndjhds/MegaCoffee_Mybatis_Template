package com.cafe.megacoffee.item.dto;

import com.cafe.megacoffee.util.date.SearchDate;
import com.cafe.megacoffee.util.page.Pagination;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class ItemDTO {

    private int rnum;

    private Integer itemId;

    private int price;

    private String memberId;

    private String content;

    private String img;

    private String title;

    private Integer categoryId;

    private String categoryName;

    private String regDate;

    private String modDate;

    private String modifier;

    private String deleteYN;

    private String optionYN;

    private Integer parentCategoryId;

    private MultipartFile uploadImg;

    private Pagination pagination;

    private SearchDate searchDate;


}
