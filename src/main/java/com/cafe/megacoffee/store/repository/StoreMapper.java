package com.cafe.megacoffee.store.repository;

import com.cafe.megacoffee.store.dto.StoreDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StoreMapper {
    public int getTotalCount(StoreDTO storeDTO);

    public List<StoreDTO> findStoreAll(StoreDTO storeDTO);

    public StoreDTO findStoreById(Integer storeId);

    public int saveStore(StoreDTO storeDTO);
}
