package com.cafe.megacoffee.order.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderRequest<T> {

    private T list;
    private String memberId;
    private Integer storeId;
}
