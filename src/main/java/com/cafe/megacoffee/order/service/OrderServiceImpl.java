package com.cafe.megacoffee.order.service;

import com.cafe.megacoffee.order.dto.OrderItem;
import com.cafe.megacoffee.order.dto.Orders;
import com.cafe.megacoffee.order.repository.OrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService{

    private final OrderMapper orderMapper;

    @Override
    public Integer createOrder(Orders orders) {
        return orderMapper.createOrder(orders);
    }

    @Override
    public int creatOrderItem(List<OrderItem> orderList) {
        int result = 0;
        for (OrderItem orderItem : orderList) {
            result += orderMapper.creatOrderItem(orderItem);
        }

        return result;

    }
}
