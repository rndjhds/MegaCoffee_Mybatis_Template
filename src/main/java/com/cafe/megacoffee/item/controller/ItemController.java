package com.cafe.megacoffee.item.controller;

import com.cafe.megacoffee.category.dto.CategoryDTO;
import com.cafe.megacoffee.category.service.CategoryService;
import com.cafe.megacoffee.item.dto.ItemDTO;
import com.cafe.megacoffee.item.service.ItemService;
import com.cafe.megacoffee.util.date.SearchDate;
import com.cafe.megacoffee.util.file.FileUpload;
import com.cafe.megacoffee.util.page.Pagination;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
    public int saveItem(HttpServletRequest request, ItemDTO itemDTO) {

        int result = 0;

        try {
            String path = request.getServletContext().getRealPath("/WEB-INF/resources/statics/img");
            String img = fileUpload.serverUploadFile(itemDTO.getUploadImg(), path);
            itemDTO.setImg(img);

            result = itemService.saveItem(itemDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @GetMapping("/updateItem/{itemId}")
    public String updateItemForm(@PathVariable("itemId") Integer itemId, Model model) {
        ItemDTO item = itemService.findItemById(itemId);
        model.addAttribute("item", item);
        return "/item/updateItem";
    }

    @PostMapping("/updateItem")
    @ResponseBody
    public int updateItem(ItemDTO itemDTO) {
        int result = itemService.updateItem(itemDTO);
        return result;
    }

    @GetMapping("/updateItemImg/{itemId}")
    public String updateItemImgForm(@PathVariable("itemId") Integer itemId, Model model) {
        ItemDTO item = itemService.findItemById(itemId);
        model.addAttribute("item", item);
        return "/item/updateItemImgForm";
    }

    @PostMapping("/updateItemImg")
    @ResponseBody
    public int updateItemImg(HttpServletRequest request, ItemDTO itemDTO) {

        int result = 0;

        try {
            String originItemImg = itemService.findItemById(itemDTO.getItemId()).getImg();

            String path = request.getServletContext().getRealPath("/WEB-INF/resources/statics/img");
            fileUpload.deleteFile(originItemImg, path);
            String img = fileUpload.serverUploadFile(itemDTO.getUploadImg(), path);
            itemDTO.setImg(img);

            result = itemService.updateItemImg(itemDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @GetMapping("/ItemList/{categoryId}")
    public String itemList(Model model, @PathVariable("categoryId") Integer categoryId) {
        List<CategoryDTO> categoryList = categoryService.findChildCategoryByParentId(categoryId);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("parentCategoryId", categoryId);
        return "/item/itemList";
    }

    @PostMapping("/itemList")
    @ResponseBody
    public List<ItemDTO> itemList(@RequestBody ItemDTO itemDTO) {
        List<ItemDTO> findItemList = itemService.findItemByCategoryId(itemDTO);
        return findItemList;
    }

    @PostMapping("/createPageCount")
    @ResponseBody
    public int createPageCount(@RequestBody ItemDTO itemDTO) {
        int totalCount = itemService.findItemCountByCategoryId(itemDTO);
        System.out.println("총 리턴값 : " + totalCount);
        int pageCount = totalCount / 8;
        System.out.println("현재 페이지 수 :" + pageCount);
        if(totalCount % 8 != 0) {
            pageCount = totalCount / 8 + 1;
            System.out.println("if 카운트 수 : " + pageCount);
        }

        return pageCount;
    }

    @GetMapping("/itemDetail/{itemId}")
    public String itemDetail(@PathVariable("itemId") Integer itemId, Model model){
        ItemDTO findItem = itemService.findItemById(itemId);
        model.addAttribute("findItem",findItem);

        return "/item/itemDetail";

    }
}
