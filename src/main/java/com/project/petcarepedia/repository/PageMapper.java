package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.PageDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PageMapper {
    int Rcount();
    int Bscount(PageDto pageDto);
    int Bcount();
    int Mscount(PageDto pageDto);
    int Mcount();
    int Hscount(PageDto pageDto);
    int Hscount2(PageDto pageDto);
    int Hcount();
    int Myscount(PageDto pageDto);
    int Mycount();
}
