package com.cafe.megacoffee.basket.dto;

import com.cafe.megacoffee.basket.type.ShoppingBasketStatus;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BasketDTO {

    private Integer shoppingBasketId;

    private String memberId;

    private ShoppingBasketStatus shoppingBasketStatus;

    private String shoppingBasketDate;
}
