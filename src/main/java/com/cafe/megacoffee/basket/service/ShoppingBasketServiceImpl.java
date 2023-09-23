package com.cafe.megacoffee.basket.service;

import com.cafe.megacoffee.basket.dto.BasketDTO;
import com.cafe.megacoffee.basket.repository.ShoppingBasketMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ShoppingBasketServiceImpl implements ShoppingBasketService{

    private final ShoppingBasketMapper shoppingBasketMapper;

    @Override
    public Integer findshoppingBasketId(BasketDTO basketDTO) {
        return shoppingBasketMapper.findshoppingBasketId(basketDTO);
    }
}
