package com.cafe.megacoffee.basket.controller;

import com.cafe.megacoffee.basket.dto.BasketDTO;
import com.cafe.megacoffee.basket.dto.ShoppingItem;
import com.cafe.megacoffee.basket.service.ShoppingBasketService;
import com.cafe.megacoffee.basket.type.ShoppingBasketStatus;
import com.cafe.megacoffee.member.dto.MemberDTO;
import com.cafe.megacoffee.store.dto.StoreDTO;
import com.cafe.megacoffee.store.service.StoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/basket")
@RequiredArgsConstructor
public class ShoppingBasketController {
    private final ShoppingBasketService shoppingBasketService;
    private final StoreService storeService;

    @PostMapping("/createBasket")
    @ResponseBody
    public boolean createBasket(@RequestBody ShoppingItem shoppingItem, HttpSession session) {

        boolean result = false;
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("member");

            BasketDTO basketDTO = shoppingItem.getBasketDTO();
            basketDTO.setMemberId(member.getMemberId());
            basketDTO.setShoppingBasketStatus(ShoppingBasketStatus.READY);

            Integer findshoppingBasketId = shoppingBasketService.findshoppingBasketId(basketDTO);
            shoppingItem.setShoppingBasketId(findshoppingBasketId);

            if (shoppingBasketService.saveShoppingItem(shoppingItem) != 0) {
                result = true;
            }
        } catch (Exception e) {
            result = false;
        }

        return result;
    }

    @GetMapping("/myBasketList")
    public String basketList(Model model) {
        List<StoreDTO> stores = storeService.findNoDeleteStore();
        model.addAttribute("stores", stores);
        return "/basket/myItemBasket";
    }

    @PostMapping("/myBasketByStoreId")
    @ResponseBody
    public List<Map<String, Object>> myBasketByStoreId(@RequestBody BasketDTO basketDTO) {

        List<Map<String, Object>> myBasketList = new ArrayList<>();
        try {
            basketDTO.setShoppingBasketStatus(ShoppingBasketStatus.READY);
            myBasketList = shoppingBasketService.findMyBasketWithMemberIdAndStoreId(basketDTO);
        } catch(IndexOutOfBoundsException e) {
            Map<String, Object> empty = new HashMap<>();
            empty.put("empty", "빈값입니다.");
            myBasketList.add(empty);
        }
        return myBasketList;
    }
}
