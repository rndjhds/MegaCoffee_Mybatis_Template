package com.cafe.megacoffee.category.service;

import com.cafe.megacoffee.category.controller.CategoryDTO;
import com.cafe.megacoffee.category.repository.CategoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService{

    private final CategoryMapper categoryMapper;

    @Override
    public List<CategoryDTO> findParentCategoryAll() {
        return categoryMapper.findParentCategoryAll();
    }

    @Override
    public List<CategoryDTO> findChildCategoryById(CategoryDTO categoryDTO) {
        return categoryMapper.findChildCategoryById(categoryDTO);
    }

    @Override
    public int getTotalCount(CategoryDTO categoryDTO) {
        return categoryMapper.getTotalCount(categoryDTO);
    }

}
