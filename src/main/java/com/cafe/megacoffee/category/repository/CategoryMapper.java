package com.cafe.megacoffee.category.repository;

import com.cafe.megacoffee.category.dto.CategoryDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {
    public List<CategoryDTO> getParentCategoryAll();

    public List<CategoryDTO> findAllChildCategoryById(CategoryDTO categoryDTO);

    public int getChildCategoryTotalCount(CategoryDTO categoryDTO);

    public CategoryDTO findCategoryById(Integer categoryId);

    public int save(CategoryDTO categoryDTO);

    public int getParentCategoryTotalCount(CategoryDTO categoryDTO);

    public List<CategoryDTO> findParentCategoryAll(CategoryDTO categoryDTO);

    public List<CategoryDTO> findChildCategoryByParentId(Integer categoryId);

    public List<CategoryDTO> getHeaderCategory();
}
