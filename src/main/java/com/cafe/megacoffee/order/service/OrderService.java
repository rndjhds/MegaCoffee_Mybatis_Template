package com.cafe.megacoffee.order.service;

import com.cafe.megacoffee.order.dto.OrderItem;
import com.cafe.megacoffee.order.dto.Orders;

import java.util.List;
import java.util.Map;

public interface OrderService {

    public int creatOrderItem(List<OrderItem> orderList);

    public Integer createOrder(Orders orders);

    void updateOrderStatus(Orders orders);

    public List<Map<String, Object>> findOrderItemByStoreId(Orders orders);

    public int findOrderItemCountByStoreId(Orders orders);
}
