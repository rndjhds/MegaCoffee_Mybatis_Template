package com.cafe.megacoffee.category.service;

import com.cafe.megacoffee.category.dto.CategoryDTO;
import com.cafe.megacoffee.category.repository.CategoryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private final CategoryMapper categoryMapper;

    @Override
    public List<CategoryDTO> getParentCategoryAll() {
        return categoryMapper.getParentCategoryAll();
    }

    @Override
    public List<CategoryDTO> findAllChildCategoryById(CategoryDTO categoryDTO) {
        return categoryMapper.findAllChildCategoryById(categoryDTO);
    }

    @Override
    public int getChildCategoryTotalCount(CategoryDTO categoryDTO) {
        return categoryMapper.getChildCategoryTotalCount(categoryDTO);
    }

    @Override
    public CategoryDTO findCategoryById(Integer categoryId) {
        return categoryMapper.findCategoryById(categoryId);
    }

    @Override
    public int save(CategoryDTO categoryDTO) {
        return categoryMapper.save(categoryDTO);
    }

    @Override
    public int getParentCategoryTotalCount(CategoryDTO categoryDTO) {
        return categoryMapper.getParentCategoryTotalCount(categoryDTO);
    }

    @Override
    public List<CategoryDTO> findParentCategoryAll(CategoryDTO categoryDTO) {
        return categoryMapper.findParentCategoryAll(categoryDTO);
    }

    @Override
    public List<CategoryDTO> findChildCategoryByParentId(Integer categoryId) {
        return categoryMapper.findChildCategoryByParentId(categoryId);
    }

    @Override
    public List<CategoryDTO> getHeaderCategory() {
        return categoryMapper.getHeaderCategory();
    }

    @Override
    public List<CategoryDTO> findNoDeleteChildCategoryByParentId(Integer categoryId) {
        return categoryMapper.findNoDeleteChildCategoryByParentId(categoryId);
    }
}
