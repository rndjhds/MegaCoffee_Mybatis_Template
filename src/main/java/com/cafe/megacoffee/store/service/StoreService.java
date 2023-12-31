package com.cafe.megacoffee.store.service;

import com.cafe.megacoffee.store.dto.StoreDTO;

import javax.mail.Store;
import java.util.List;

public interface StoreService {
    public int getTotalCount(StoreDTO storeDTO);

    public List<StoreDTO> findStoreAll(StoreDTO storeDTO);

    public StoreDTO findStoreById(Integer storeId);

    public int saveStore(StoreDTO storeDTO);

    public List<StoreDTO> findNoDeleteStore();

    public List<StoreDTO> findStoreByMemberId(String memberId);

    public List<StoreDTO> findStore();
}
