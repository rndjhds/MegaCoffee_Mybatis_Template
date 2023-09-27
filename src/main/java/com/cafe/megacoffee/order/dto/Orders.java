package com.cafe.megacoffee.order.dto;

import com.cafe.megacoffee.order.type.OrderStatus;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Orders {

    private Integer orderId;
    private String memberId;
    private String orderDate;
    private OrderStatus orderStatus;
    private Integer storeId;
    private int amount;
    private String merchantUid;
    private String orderProductName;
}
