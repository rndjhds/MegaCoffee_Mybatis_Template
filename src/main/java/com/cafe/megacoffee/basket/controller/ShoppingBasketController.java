package com.cafe.megacoffee.basket.controller;

import com.cafe.megacoffee.basket.dto.BasketDTO;
import com.cafe.megacoffee.basket.dto.ShoppingItem;
import com.cafe.megacoffee.basket.repository.ShoppingBasketMapper;
import com.cafe.megacoffee.basket.service.ShoppingBasketService;
import com.cafe.megacoffee.basket.type.ShoppingBasketStatus;
import com.cafe.megacoffee.member.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/basket")
@RequiredArgsConstructor
public class ShoppingBasketController {
    private final ShoppingBasketService shoppingBasketService;

    private final ShoppingBasketMapper shoppingBasketMapper;

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
        }catch (Exception e) {
            result = false;
        }

        return result;
    }

  /*  @GetMapping("/basketList")
    public String basketList() {

    }*/
}
