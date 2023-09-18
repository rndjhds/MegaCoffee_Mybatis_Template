package com.cafe.megacoffee.store.dto;

import com.cafe.megacoffee.util.date.SearchDate;
import com.cafe.megacoffee.util.page.Pagination;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreDTO {

    private int rnum;
    private Integer storeId;

    private String storeName;

    private String address;

    private String zipcode;

    private String addressDetail;

    private String deleteYN;

    private String register;

    private String regDate;

    private String modDate;

    private String modifier;

    private String memberId;

    private SearchDate searchDate;

    private Pagination pagination;
}
