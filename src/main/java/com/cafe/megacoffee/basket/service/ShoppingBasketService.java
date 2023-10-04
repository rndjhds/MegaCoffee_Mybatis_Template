package com.cafe.megacoffee.basket.service;

import com.cafe.megacoffee.basket.dto.BasketDTO;
import com.cafe.megacoffee.basket.dto.ShoppingItem;

import java.util.List;
import java.util.Map;

public interface ShoppingBasketService {

    public Integer findshoppingBasketId(BasketDTO basketDTO);

    public int saveShoppingItem(ShoppingItem shoppingItem);

    public List<Map<String, Object>> findMyBasketWithMemberIdAndStoreId(BasketDTO basketDTO);

    public int deleteShoppingItem(Integer shoppingItemId);

    void deleteShoppingBasketWithBasketItem(Integer shoppingBasketId);
}
