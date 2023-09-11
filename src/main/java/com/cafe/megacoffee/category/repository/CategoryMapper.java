package com.cafe.megacoffee.category.repository;

import com.cafe.megacoffee.category.controller.CategoryDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CategoryMapper {
    public List<CategoryDTO> findParentCategoryAll();

    public List<CategoryDTO> findChildCategoryById(CategoryDTO categoryDTO);

    public int getTotalCount(CategoryDTO categoryDTO);
}
