package com.cafe.megacoffee.order.controller;

import com.cafe.megacoffee.member.dto.MemberDTO;
import com.cafe.megacoffee.order.dto.OrderItem;
import com.cafe.megacoffee.order.dto.OrderRequest;
import com.cafe.megacoffee.order.dto.Orders;
import com.cafe.megacoffee.order.service.OrderService;
import com.cafe.megacoffee.order.type.OrderStatus;
import com.cafe.megacoffee.store.dto.StoreDTO;
import com.cafe.megacoffee.store.service.StoreService;
import com.cafe.megacoffee.util.page.Pagination;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;
    private final StoreService storeService;

    @PostMapping("/creatOrderItem")
    @ResponseBody
    public boolean creatOrderItem(@RequestBody OrderRequest<List<OrderItem>> list) {

        Orders orders = new Orders();
        orders.setOrderStatus(OrderStatus.PROCESSING);
        orders.setMemberId(list.getMemberId());
        orders.setStoreId(list.getStoreId());
        orders.setOrderProductName(list.getOrderProductName());
        orders.setAmount(list.getAmount());
        orders.setMerchantUid(list.getMerchantUid());
        orderService.createOrder(orders);

        for (OrderItem orderItem : list.getList()) {
            orderItem.setOrderId(orders.getOrderId());
        }
        int orderItemCount = orderService.creatOrderItem(list.getList());

        if (orderItemCount == list.getList().size()) {
            orders.setOrderStatus(OrderStatus.ORDERCOMP);
            orderService.updateOrderStatus(orders);
            return true;
        }
        return false;
    }

    @GetMapping("/orderManagement")
    public String orderManagement(HttpSession session, Model model) {
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        List<StoreDTO> memberStores = storeService.findStoreByMemberId(member.getMemberId());
        model.addAttribute("stores", memberStores);
        return "/orders/orderManagement";
    }

    @PostMapping("/findOrderItemByStoreId")
    @ResponseBody
    public Map<String, Object> findOrderItemByStoreId(Orders orders, Pagination pagination) {
        orders.setPagination(pagination);
        List<Map<String, Object>> orderItemToStore= orderService.findOrderItemByStoreId(orders);
        int totalCountResult = orderService.findOrderItemCountByStoreId(orders);

        Map<String, Object> map = new HashMap<>();
        map.put("data", orderItemToStore);
        map.put("recordsFiltered", totalCountResult);
        map.put("recordsTotal", totalCountResult);
        return map;
    }

    @PostMapping("/updateOrderStatusToCOMPITEM/{orderId}")
    @ResponseBody
    public void updateOrderStatusToCOMPITEM(@PathVariable("orderId") Integer orderId) {
        Orders orders = new Orders();
        orders.setOrderId(orderId);
        orders.setOrderStatus(OrderStatus.COMPITEM);
        orderService.updateOrderStatus(orders);
    }
}
