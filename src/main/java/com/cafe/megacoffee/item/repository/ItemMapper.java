package com.cafe.megacoffee.item.repository;


import com.cafe.megacoffee.item.dto.ItemDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ItemMapper {
    public List<ItemDTO> findItemByCategoryId(ItemDTO itemDTO);

    public int findItemCountByCategoryId(ItemDTO itemDTO);

    public ItemDTO findItemById(Integer itemId);

    public int saveItem(ItemDTO itemDTO);

    public int updateItem(ItemDTO itemDTO);
}
