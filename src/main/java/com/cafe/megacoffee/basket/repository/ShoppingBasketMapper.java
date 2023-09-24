package com.cafe.megacoffee.basket.repository;

import com.cafe.megacoffee.basket.dto.BasketDTO;
import com.cafe.megacoffee.basket.dto.ShoppingItem;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShoppingBasketMapper {

    public Integer findshoppingBasketId(BasketDTO basketDTO);

    public int saveShoppingItem(ShoppingItem shoppingItem);
}