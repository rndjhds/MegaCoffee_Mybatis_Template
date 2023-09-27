package com.cafe.megacoffee.order.service;

import com.cafe.megacoffee.order.dto.OrderItem;
import com.cafe.megacoffee.order.dto.Orders;

import java.util.List;

public interface OrderService {
    public int creatOrderItem(List<OrderItem> orderList);

    public Integer createOrder(Orders orders);

    void updateOrderToOrderComp(Orders orders);
}
