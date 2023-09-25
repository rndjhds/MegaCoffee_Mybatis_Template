package com.cafe.megacoffee.basket.service;

import com.cafe.megacoffee.basket.dto.BasketDTO;
import com.cafe.megacoffee.basket.dto.ShoppingItem;

public interface ShoppingBasketService {

    public Integer findshoppingBasketId(BasketDTO basketDTO);

    public int saveShoppingItem(ShoppingItem shoppingItem);
}
