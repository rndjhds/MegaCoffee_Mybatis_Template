package com.cafe.megacoffee.category.service;

import com.cafe.megacoffee.category.dto.CategoryDTO;
import com.cafe.megacoffee.category.repository.CategoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService{

    private final CategoryMapper categoryMapper;

    @Override
    public List<CategoryDTO> findParentCategoryAll() {
        return categoryMapper.findParentCategoryAll();
    }

    @Override
    public List<CategoryDTO> findAllChildCategoryById(CategoryDTO categoryDTO) {
        return categoryMapper.findAllChildCategoryById(categoryDTO);
    }

    @Override
    public int getTotalCount(CategoryDTO categoryDTO) {
        return categoryMapper.getTotalCount(categoryDTO);
    }

    @Override
    public CategoryDTO findChildCategoryById(int categoryId) {
        return categoryMapper.findChildCategoryById(categoryId);
    }

    @Override
    public void save(CategoryDTO categoryDTO) {
        categoryMapper.save(categoryDTO);
    }
}
