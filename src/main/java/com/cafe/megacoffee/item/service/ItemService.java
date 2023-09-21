package com.cafe.megacoffee.item.service;

import com.cafe.megacoffee.item.dto.ItemDTO;

import java.util.List;

public interface ItemService {
    public List<ItemDTO> findItemByCategoryId(ItemDTO itemDTO);

    public int findItemCountByCategoryId(ItemDTO itemDTO);

    public ItemDTO findItemById(Integer itemId);

    public int saveItem(ItemDTO itemDTO);

    public int updateItem(ItemDTO itemDTO);
}
