package com.cafe.megacoffee.store.controller;

import com.cafe.megacoffee.member.dto.MemberDTO;
import com.cafe.megacoffee.member.service.MemberService;
import com.cafe.megacoffee.store.dto.StoreDTO;
import com.cafe.megacoffee.store.service.StoreService;
import com.cafe.megacoffee.util.date.SearchDate;
import com.cafe.megacoffee.util.page.Pagination;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/store")
@RequiredArgsConstructor
public class StoreController {

    private final StoreService storeService;
    private final MemberService memberService;

    @GetMapping("/List")
    public String storeList() {
        return "/store/storeList";
    }

    @PostMapping("/findStoreAll")
    @ResponseBody
    public Map<String, Object> findStoreAll(StoreDTO storeDTO, SearchDate searchDate, Pagination pagination, Model model) {
        storeDTO.setPagination(pagination);
        storeDTO.setSearchDate(searchDate);

        int totalCountResult = storeService.getTotalCount(storeDTO);
        List<StoreDTO> stores = storeService.findStoreAll(storeDTO);

        Map<String, Object> map = new HashMap<>();
        map.put("data", stores);
        map.put("recordsFiltered", totalCountResult);
        map.put("recordsTotal", totalCountResult);
        return map;
    }

    @GetMapping("/saveStore")
    public String createStoreForm(@RequestParam(value = "storeId", required = false) Integer storeId, Model model) {
        if(storeId != null) {
            StoreDTO storeDTO = storeService.findStoreById(storeId);
            model.addAttribute("store", storeDTO);
        }

        List<MemberDTO> managers = memberService.findMemberStatusByManager();
        model.addAttribute("managers", managers);
        return "/store/createStoreForm";
    }

    @PostMapping("/savestore")
    @ResponseBody
    public int saveStore(@RequestBody StoreDTO storeDTO) {
        if (storeDTO.getStoreId() == null && storeDTO.getDeleteYN() == null){
            storeDTO.setStoreId(0);
            storeDTO.setDeleteYN("N");
        }
        return storeService.saveStore(storeDTO);
    }
}
