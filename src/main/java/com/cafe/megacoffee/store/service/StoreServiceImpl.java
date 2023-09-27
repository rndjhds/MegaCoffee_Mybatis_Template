package com.cafe.megacoffee.store.service;

import com.cafe.megacoffee.store.dto.StoreDTO;
import com.cafe.megacoffee.store.repository.StoreMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StoreServiceImpl implements StoreService{

    private final StoreMapper storeMapper;

    @Override
    public int getTotalCount(StoreDTO storeDTO) {
        return storeMapper.getTotalCount(storeDTO);
    }

    @Override
    public List<StoreDTO> findStoreAll(StoreDTO storeDTO) {
        return storeMapper.findStoreAll(storeDTO);
    }

    @Override
    public StoreDTO findStoreById(Integer storeId) {
        return storeMapper.findStoreById(storeId);
    }

    @Override
    public int saveStore(StoreDTO storeDTO) {
        return storeMapper.saveStore(storeDTO);
    }

    @Override
    public List<StoreDTO> findNoDeleteStore() {
        return storeMapper.findNoDeleteStore();
    }

    @Override
    public List<StoreDTO> findStoreByMemberId(String memberId) {
        return storeMapper.findStoreByMemberId(memberId);
    }
}
