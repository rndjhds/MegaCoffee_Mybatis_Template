package com.cafe.megacoffee.category.controller;

import com.cafe.megacoffee.category.service.CategoryService;
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
        return "/category/category";
    }

    @PostMapping("/findCategory")
    @ResponseBody
    public Map<String, Object> findCategoryById(CategoryDTO categoryDTO, @RequestParam("length") String length) {
        System.out.println("length = " + length);
        int totalCount = categoryService.getTotalCount(categoryDTO);
        List<CategoryDTO> data = categoryService.findChildCategoryById(categoryDTO);
        Map<String, Object> map = new HashMap<>();
        map.put("data", data);
        map.put("recordsFiltered", totalCount);
        map.put("recordsTotal", totalCount);
        return map;
    }
  
}
