package com.cafe.megacoffee.basket.service;

import com.cafe.megacoffee.basket.dto.BasketDTO;
import com.cafe.megacoffee.basket.dto.ShoppingItem;
import com.cafe.megacoffee.basket.repository.ShoppingBasketMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ShoppingBasketServiceImpl implements ShoppingBasketService {

    private final ShoppingBasketMapper shoppingBasketMapper;

    @Override
    public Integer findshoppingBasketId(BasketDTO basketDTO) {
        shoppingBasketMapper.findshoppingBasketId(basketDTO);
        return basketDTO.getShoppingBasketId();
    }

    @Override
    public int saveShoppingItem(ShoppingItem shoppingItem) {
        System.out.println(shoppingItem.getItemId());
        System.out.println(shoppingItem.getShoppingItemId());
        System.out.println(shoppingItem.getShoppingBasketId());
        System.out.println(shoppingItem.getOrderCup());
        System.out.println(shoppingItem.getOrderCount());
        System.out.println(shoppingItem.getOrderPrice());
        System.out.println(shoppingItem.getOrderOption());
        System.out.println(shoppingItem.getItemId());
        System.out.println(shoppingItem.getOrderSize());
        return shoppingBasketMapper.saveShoppingItem(shoppingItem);
    }

    @Override
    public List<Map<String, Object>> findMyBasketWithMemberIdAndStoreId(BasketDTO basketDTO) {
        return shoppingBasketMapper.findMyBasketWithMemberIdAndStoreId(basketDTO);
    }

    @Override
    public int deleteShoppingItem(Integer shoppingItemId) {
        return shoppingBasketMapper.deleteShoppingItem(shoppingItemId);
    }

    @Override
    public void deleteShoppingBasketWithBasketItem(Integer shoppingBasketId) {
        shoppingBasketMapper.deleteShoppingBasketWithBasketItem(shoppingBasketId);
    }
}
