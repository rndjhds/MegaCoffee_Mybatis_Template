package com.cafe.megacoffee.order.service;

import com.cafe.megacoffee.order.dto.Orders;
import com.cafe.megacoffee.order.repository.OrderMapper;
import com.cafe.megacoffee.order.type.OrderStatus;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class OrderServiceImplTest {

    @Autowired
    private OrderMapper orderMapper;
    @Test
    void createOrder() {
        Orders orders =  new Orders();
        orders.setMemberId("admin");
        orders.setOrderStatus(OrderStatus.PROCESSING);
        orders.setStoreId(22);

        Integer order = orderMapper.createOrder(orders);
        System.out.println(orders.getOrderId());
    }
}