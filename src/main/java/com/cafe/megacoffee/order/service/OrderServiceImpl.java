package com.cafe.megacoffee.order.service;

import com.cafe.megacoffee.order.dto.OrderItem;
import com.cafe.megacoffee.order.dto.Orders;
import com.cafe.megacoffee.order.repository.OrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public int updateOrderStatus(Orders orders) {
        return orderMapper.updateOrderStatus(orders);
    }

    @Override
    public List<Map<String, Object>> findOrderItemByStoreId(Orders orders) {
        return orderMapper.findOrderItemByStoreId(orders);
    }

    @Override
    public int findOrderItemCountByStoreId(Orders orders) {
        return orderMapper.findOrderItemCountByStoreId(orders);
    }

    @Override
    public List<Map<String, Object>> findOrderedItemList(Map<String, Object> map) {
        return orderMapper.findOrderedItemList(map);
    }

    @Override
    public int getOrderedItemCount(Map<String, Object> map) {
        return orderMapper.getOrderedItemCount(map);
    }

    @Override
    public List<Map<String, Object>> findOrderDetailByOrderId(String orderId) {
        return orderMapper.findOrderDetailByOrderId(orderId);
    }
}
