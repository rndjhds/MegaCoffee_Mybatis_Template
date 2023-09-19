package com.cafe.megacoffee.item.controller;

import com.cafe.megacoffee.category.dto.CategoryDTO;
import com.cafe.megacoffee.category.service.CategoryService;
import com.cafe.megacoffee.item.dto.ItemDTO;
import com.cafe.megacoffee.item.service.ItemService;
import com.cafe.megacoffee.util.FileUpload;
import com.cafe.megacoffee.util.date.SearchDate;
import com.cafe.megacoffee.util.page.Pagination;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
public class ItemController {

    private final ItemService itemService;
    private final CategoryService categoryService;

    private final FileUpload fileUpload;

    @Value("${spring.servlet.multipart.location}")
    private String path;

    @GetMapping("/manageItemList/{categoryId}")
    public String manageItemList(@PathVariable("categoryId") Integer categoryId, Model model) {
        List<CategoryDTO> findChildCategory = categoryService.findChildCategoryByParentId(categoryId);
        model.addAttribute("category", findChildCategory);
        model.addAttribute("parentCategoryId", categoryId);
        return "/item/manageItemList";
    }

    @PostMapping("/findItemByCategoryId")
    @ResponseBody
    public Map<String, Object> findItemByCategoryId(ItemDTO itemDTO, Pagination pagination, SearchDate searchDate) {
        itemDTO.setPagination(pagination);
        itemDTO.setSearchDate(searchDate);

        List<ItemDTO> findItemResult = itemService.findItemByCategoryId(itemDTO);
        int totalCountResult = itemService.findItemCountByCategoryId(itemDTO);

        Map<String, Object> map = new HashMap<>();
        map.put("data", findItemResult);
        map.put("recordsFiltered", totalCountResult);
        map.put("recordsTotal", totalCountResult);
        return map;
    }

    @GetMapping("/createItemForm/{parentCategoryId}")
    public String createItemForm(@PathVariable("parentCategoryId") Integer parentCategoryId, Model model) {

        List<CategoryDTO> resultChildCategory = categoryService.findChildCategoryByParentId(parentCategoryId);
        model.addAttribute("parentCategoryId", resultChildCategory);

        return "/item/createItemForm";
    }

    @PostMapping("/saveItem")
    @ResponseBody
    public int saveItem(ItemDTO itemDTO) {

        int result = 0;
        try {
            String img = fileUpload.serverUploadFile(itemDTO.getUploadImg(), path);
            itemDTO.setImg(img);

            result = itemService.saveItem(itemDTO);
        }catch (Exception e) {
            e.printStackTrace();
        }


        return result;
    }
}
