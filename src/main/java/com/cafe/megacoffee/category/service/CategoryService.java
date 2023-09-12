package com.cafe.megacoffee.category.service;

import com.cafe.megacoffee.category.dto.CategoryDTO;

import java.util.List;

public interface CategoryService {
    public List<CategoryDTO> findParentCategoryAll();

    public List<CategoryDTO> findAllChildCategoryById(CategoryDTO categoryDTO);

    public int getTotalCount(CategoryDTO categoryDTO);

    public CategoryDTO findChildCategoryById(int categoryId);

    public void save(CategoryDTO categoryDTO);
}

