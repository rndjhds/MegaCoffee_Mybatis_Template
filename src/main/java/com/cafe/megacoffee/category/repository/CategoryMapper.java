package com.cafe.megacoffee.category.repository;

import com.cafe.megacoffee.category.dto.CategoryDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {
    public List<CategoryDTO> findParentCategoryAll();

    public List<CategoryDTO> findAllChildCategoryById(CategoryDTO categoryDTO);

    public int getChildCategoryTotalCount(CategoryDTO categoryDTO);

    public CategoryDTO findChildCategoryById(int categoryId);

    public int save(CategoryDTO categoryDTO);
}
