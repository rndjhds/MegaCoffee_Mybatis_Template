package com.cafe.megacoffee.category.controller;

import com.cafe.megacoffee.category.dto.CategoryDTO;
import com.cafe.megacoffee.category.service.CategoryService;
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
@RequiredArgsConstructor
@RequestMapping("/category")
public class CategoryController {

    private final CategoryService categoryService;

    @GetMapping("/parentCategory")
    public String categoryParentView(Model model) {
        return "/category/findParentCategory";
    }

    @PostMapping("/findParentCategoryAll")
    @ResponseBody
    public Map<String, Object> findParentCategoryAll(CategoryDTO categoryDTO, Pagination pagination, SearchDate searchDate) {
        categoryDTO.setPagination(pagination);
        categoryDTO.setSearchDate(searchDate);
        int totalCount = categoryService.getParentCategoryTotalCount(categoryDTO);
        List<CategoryDTO> data = categoryService.findParentCategoryAll(categoryDTO);

        Map<String, Object> map = new HashMap<>();
        map.put("data", data);
        map.put("recordsFiltered", totalCount);
        map.put("recordsTotal", totalCount);
        return map;
    }

    @GetMapping("/childCategory")
    public String categoryChildView(Model model) {
        List<CategoryDTO> findParentCategory = categoryService.getParentCategoryAll();
        model.addAttribute("category", findParentCategory);
        return "/category/findChildCategory";
    }

    @PostMapping("/findChildCategoryAll")
    @ResponseBody
    public Map<String, Object> findChildCategoryAllById(CategoryDTO categoryDTO, Pagination pagination, SearchDate searchDate) {
        categoryDTO.setPagination(pagination);
        categoryDTO.setSearchDate(searchDate);

        int totalCount = categoryService.getChildCategoryTotalCount(categoryDTO);
        List<CategoryDTO> data = categoryService.findAllChildCategoryById(categoryDTO);

        Map<String, Object> map = new HashMap<>();
        map.put("data", data);
        map.put("recordsFiltered", totalCount);
        map.put("recordsTotal", totalCount);
        return map;
    }

    @GetMapping("/saveChildCategory")
    public String saveChildCategory(@RequestParam(value = "categoryId", required = false) Integer categoryId, Model model) {
        if (categoryId != null) {
            CategoryDTO findChildCategory = categoryService.findCategoryById(categoryId);
            model.addAttribute("category", findChildCategory);
        }
        List<CategoryDTO> findParentCategory = categoryService.getParentCategoryAll();
        model.addAttribute("parentCategory", findParentCategory);
        return "/category/saveChildCateogry";
    }

    @PostMapping("/saveCategory")
    @ResponseBody
    public int save(@RequestBody CategoryDTO categoryDTO) {
        if (categoryDTO.getCategoryId() == null && categoryDTO.getDeleteYN() == null) {
            categoryDTO.setCategoryId(0);
            categoryDTO.setDeleteYN("N");
        }
        return categoryService.save(categoryDTO);
    }

    @GetMapping("/saveParentCategory")
    public String saveParentCategory(@RequestParam(value = "categoryId", required = false) Integer categoryId, Model model) {
        if (categoryId != null) {
            CategoryDTO findParentCategory = categoryService.findCategoryById(categoryId);
            model.addAttribute("category", findParentCategory);
        }
        return "/category/saveParentCategory";
    }

    @PostMapping("/getHeaderCategory")
    @ResponseBody
    public List<CategoryDTO> getHeaderCategory() {
        return categoryService.getHeaderCategory();
    }

}
