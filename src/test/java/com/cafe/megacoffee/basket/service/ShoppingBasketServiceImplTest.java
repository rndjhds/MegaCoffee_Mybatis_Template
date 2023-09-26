package com.cafe.megacoffee.basket.service;

import com.cafe.megacoffee.basket.dto.ShoppingItem;
import com.cafe.megacoffee.basket.repository.ShoppingBasketMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ShoppingBasketServiceImplTest {

    @Autowired
    private ShoppingBasketMapper shoppingBasketMapper;
    @Test
    void saveShoppingItem() {
        ShoppingItem shoppingItem = new ShoppingItem();
        shoppingItem.setShoppingItemId(1);
        shoppingItem.setShoppingBasketId(89);
        shoppingItem.setItemId(2);
        shoppingItem.setOrderCount(10);
        shoppingItem.setOrderPrice(10000);

        int result = shoppingBasketMapper.saveShoppingItem(shoppingItem);
        System.out.println(result);
    }
}