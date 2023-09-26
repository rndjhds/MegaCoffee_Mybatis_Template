package com.cafe.megacoffee.order.controller;

import com.cafe.megacoffee.order.dto.OrderItem;
import com.cafe.megacoffee.order.dto.OrderRequest;
import com.cafe.megacoffee.order.dto.Orders;
import com.cafe.megacoffee.order.service.OrderService;
import com.cafe.megacoffee.order.type.OrderStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;
    @PostMapping("/creatOrderItem")
    @ResponseBody
    public boolean creatOrderItem(@RequestBody OrderRequest<List<OrderItem>> list) {

        Orders orders = new Orders();
        orders.setOrderStatus(OrderStatus.PROCESSING);
        orders.setMemberId(list.getMemberId());
        orders.setStoreId(list.getStoreId());
        Integer orderId = orderService.createOrder(orders);

        for (OrderItem orderItem: list.getList()) {
            orderItem.setOrderId(orderId);
        }
        int orderItemCount = orderService.creatOrderItem(list.getList());

        if(orderItemCount == list.getList().size()) {
            return true;
        }
        return false;
    }
}
