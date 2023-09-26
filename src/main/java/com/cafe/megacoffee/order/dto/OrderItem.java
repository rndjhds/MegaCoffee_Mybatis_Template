package com.cafe.megacoffee.order.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderItem {

    private Integer orderItemId;
    private Integer orderId;
    private Integer itemId;
    private int orderPrice;
    private int orderCount;
    private String orderCup;
    private String orderOption;
    private String orderSize;
}
