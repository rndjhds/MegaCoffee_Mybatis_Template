package com.cafe.megacoffee.category.controller;

import com.cafe.megacoffee.category.dto.CategoryDTO;
import com.cafe.megacoffee.category.service.CategoryService;
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

    @GetMapping("/manage")
    public String categoryManageView(Model model) {
        List<CategoryDTO> findCategory = categoryService.findParentCategoryAll();
        model.addAttribute("category", findCategory);
        return "/category/findCategory";
    }

    @PostMapping("/findCategory")
    @ResponseBody
    public Map<String, Object> findCategoryById(CategoryDTO categoryDTO, Pagination pagination) {
        categoryDTO.setPagination(pagination);
        int totalCount = categoryService.getTotalCount(categoryDTO);
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
            CategoryDTO findChildCategory = categoryService.findChildCategoryById(categoryId);
            model.addAttribute("category", findChildCategory);
        }
        List<CategoryDTO> findParentCategory = categoryService.findParentCategoryAll();
        model.addAttribute("parentCategory", findParentCategory);
        return "/category/saveChildCateogry";
    }

    @PostMapping("/saveChildCategory")
    public String save(CategoryDTO categoryDTO) {
        if (categoryDTO.getCategoryId() == null) {
            categoryDTO.setCategoryId(0);
        }

        System.out.println("categoryId" + categoryDTO.getCategoryId());
        System.out.println("category");
        System.out.println("category");
        System.out.println("category");
        System.out.println("category");

        categoryService.save(categoryDTO);
        return "";
    }

}
