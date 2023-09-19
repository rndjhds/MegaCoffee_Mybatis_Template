package com.cafe.megacoffee.item.service;

import com.cafe.megacoffee.item.dto.ItemDTO;
import com.cafe.megacoffee.item.repository.ItemMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {

    private final ItemMapper itemMapper;

    @Override
    public List<ItemDTO> findItemByCategoryId(ItemDTO itemDTO) {
        return itemMapper.findItemByCategoryId(itemDTO);
    }

    @Override
    public int findItemCountByCategoryId(ItemDTO itemDTO) {
        return itemMapper.findItemCountByCategoryId(itemDTO);
    }

    @Override
    public ItemDTO findItemById(Integer itemId) {
        return itemMapper.findItemById(itemId);
    }

    @Override
    public int saveItem(ItemDTO itemDTO) {
        return itemMapper.saveItem(itemDTO);
    }

}
