package com.cafe.megacoffee.order.repository;

import com.cafe.megacoffee.order.dto.OrderItem;
import com.cafe.megacoffee.order.dto.Orders;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {


    public Integer createOrder(Orders orders);
    public int creatOrderItem(OrderItem orderItem);

    void updateOrderToOrderComp(Orders orders);
}
