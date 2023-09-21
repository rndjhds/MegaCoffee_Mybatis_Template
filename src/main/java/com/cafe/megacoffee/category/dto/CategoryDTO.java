package com.cafe.megacoffee.category.dto;

import com.cafe.megacoffee.util.date.SearchDate;
import com.cafe.megacoffee.util.page.Pagination;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryDTO {

    private int rnum;
    private Integer categoryId;
    private String memberId;
    private String categoryName;
    private Integer parentId;
    private String regDate;
    private String modifier;
    private String modDate;
    private String deleteYN;
    private String parentName;
    private Pagination pagination;
    private SearchDate searchDate;
}
