package com.cafe.megacoffee.category.controller;

import com.cafe.megacoffee.category.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public List<CategoryDTO> findCategoryById(CategoryDTO categoryDTO) {
        int totalCount = categoryService.getTotalCount(categoryDTO);
        System.out.println("totalCount = " + totalCount);
        categoryDTO.setTotalCount(totalCount);
        List<CategoryDTO> data = categoryService.findChildCategoryById(categoryDTO);
        return data;
    }
  
}
