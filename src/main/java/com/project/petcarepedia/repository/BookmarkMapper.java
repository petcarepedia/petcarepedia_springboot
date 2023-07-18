package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.BookmarkDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BookmarkMapper {
    int deleteBookmark(BookmarkDto bookMarkDto);
    int delete(String bmid);
    ArrayList<BookmarkDto> select(String mid);
    int checkBookmark(BookmarkDto bookMarkDto);
    int insert(BookmarkDto bookMarkDto);
}
