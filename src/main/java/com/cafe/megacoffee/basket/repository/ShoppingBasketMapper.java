package com.cafe.megacoffee.basket.repository;

import com.cafe.megacoffee.basket.dto.BasketDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShoppingBasketMapper {

    public Integer findshoppingBasketId(BasketDTO basketDTO);
}