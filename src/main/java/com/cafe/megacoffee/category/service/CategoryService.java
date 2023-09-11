package com.cafe.megacoffee.category.service;

import com.cafe.megacoffee.category.controller.CategoryDTO;

import java.util.List;
import java.util.Map;

public interface CategoryService {
    public List<CategoryDTO> findParentCategoryAll();

    public List<CategoryDTO> findChildCategoryById(CategoryDTO categoryDTO);

    public int getTotalCount(CategoryDTO categoryDTO);
}

