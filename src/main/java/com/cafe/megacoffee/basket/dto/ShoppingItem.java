package com.cafe.megacoffee.basket.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShoppingItem {

    private Integer shoppingItemId;
    private Integer shoppingBasketId;
    private Integer itemId;
    private int orderCount;
    private int orderPrice;
    private String orderCup;
    private String orderOption;
    private String orderSize;
    private BasketDTO basketDTO;

}
