package com.cafe.megacoffee.order.repository;

import com.cafe.megacoffee.order.dto.OrderItem;
import com.cafe.megacoffee.order.dto.Orders;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderMapper {


    public Integer createOrder(Orders orders);
    public int creatOrderItem(OrderItem orderItem);

    int updateOrderStatus(Orders orders);

    public List<Map<String, Object>> findOrderItemByStoreId(Orders orders);

    public int findOrderItemCountByStoreId(Orders orders);

    public List<Map<String, Object>> findOrderedItemList(Map<String, Object> map);

    public int getOrderedItemCount(Map<String, Object> map);

    public List<Map<String, Object>> findOrderDetailByOrderId(String orderId);

    Integer findRecentPaymentHistory(String memberId);
}
