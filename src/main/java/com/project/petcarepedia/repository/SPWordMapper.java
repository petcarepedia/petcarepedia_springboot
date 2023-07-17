package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.SPWordDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SPWordMapper {
    int insert(String word);
    SPWordDto select();
}
