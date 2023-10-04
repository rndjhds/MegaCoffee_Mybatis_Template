package com.cafe.megacoffee.basket.repository;

import com.cafe.megacoffee.basket.dto.BasketDTO;
import com.cafe.megacoffee.basket.dto.ShoppingItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ShoppingBasketMapper {

    public Integer findshoppingBasketId(BasketDTO basketDTO);

    public int saveShoppingItem(ShoppingItem shoppingItem);

    public List<Map<String, Object>> findMyBasketWithMemberIdAndStoreId(BasketDTO basketDTO);

    public int deleteShoppingItem(Integer shoppingItemId);

    void deleteShoppingBasketWithBasketItem(Integer shoppingBasketId);
}