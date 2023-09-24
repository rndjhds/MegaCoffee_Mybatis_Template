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

        MemberDTO member = (MemberDTO) session.getAttribute("member");
        BasketDTO basketDTO = new BasketDTO();
        basketDTO.setMemberId(member.getMemberId());
        basketDTO.setShoppingBasketStatus(ShoppingBasketStatus.READY);
        Integer findshoppingBasketId = shoppingBasketService.findshoppingBasketId(basketDTO);
        System.out.println(findshoppingBasketId);
        shoppingItem.setShoppingBasketId(findshoppingBasketId);
        shoppingBasketMapper.saveShoppingItem(shoppingItem);


        boolean result = false;

        return result;
    }
}
