package com.cafe.megacoffee.order.controller;

import com.cafe.megacoffee.basket.service.ShoppingBasketService;
import com.cafe.megacoffee.category.dto.CategoryDTO;
import com.cafe.megacoffee.category.service.CategoryService;
import com.cafe.megacoffee.member.dto.MemberDTO;
import com.cafe.megacoffee.member.type.MemberType;
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
    private final CategoryService categoryService;
    private final ShoppingBasketService shoppingBasketService;

    @PostMapping("/creatOrderItem")
    @ResponseBody
    public Map<String, Object> creatOrderItem(@RequestBody OrderRequest<List<OrderItem>> list) {

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

        Map<String, Object> map = new HashMap<>();
        map.put("orderId", orders.getOrderId());
        if (orderItemCount == list.getList().size()) {
            orders.setOrderStatus(OrderStatus.ORDERCOMP);
            orderService.updateOrderStatus(orders);
            map.put("resultType", true);
        }

        if(list.getShoppingBasketId() != null && list.getShoppingBasketId() != 0) {
            shoppingBasketService.deleteShoppingBasketWithBasketItem(list.getShoppingBasketId());
        }
        return map;
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
        List<Map<String, Object>> orderItemToStore = orderService.findOrderItemByStoreId(orders);
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

    @GetMapping("/orderdItemList")
    public String orderedItemList(Model model, HttpSession session) {
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member.getMemberType() == MemberType.MANAGER) {
            model.addAttribute("stores", storeService.findStoreByMemberId(member.getMemberId()));
        } else if (member.getMemberType() == MemberType.ADMIN) {
            model.addAttribute("stores", storeService.findStore());
        }
        List<CategoryDTO> parentCategoryAll = categoryService.getParentCategoryAll();
        model.addAttribute("parentCategories", parentCategoryAll);
        return "/orders/orderedItemList";
    }

    @PostMapping("/findOrderedItemList")
    @ResponseBody
    public Map<String, Object> findOrderedItemList(@RequestParam Map<String, Object> map, HttpSession session) {
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member.getMemberType() == MemberType.MANAGER) {
            map.put("memberId", member.getMemberId());
        }
        List<Map<String, Object>> orderedItemList = orderService.findOrderedItemList(map);
        int totalResultCount = orderService.getOrderedItemCount(map);

        Map<String, Object> resultmap = new HashMap<>();
        resultmap.put("data", orderedItemList);
        resultmap.put("recordsFiltered", totalResultCount);
        resultmap.put("recordsTotal", totalResultCount);
        return resultmap;
    }

    @GetMapping("/orderDetail/{orderId}")
    public String orderDetail(Model model, @PathVariable("orderId") String orderId) {
        List<Map<String, Object>> orders = orderService.findOrderDetailByOrderId(orderId);

        model.addAttribute("orders", orders);
        model.addAttribute("storeName", orders.get(0).get("STORENAME"));
        model.addAttribute("orderDate", orders.get(0).get("ORDERDATE"));
        model.addAttribute("orderId", orders.get(0).get("ORDERID"));
        model.addAttribute("amount", orders.get(0).get("AMOUNT"));
        return "/orders/orderDetail";
    }
}
