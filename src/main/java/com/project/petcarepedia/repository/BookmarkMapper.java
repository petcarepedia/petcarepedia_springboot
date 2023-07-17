package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.BookmarkDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookmarkMapper {
    int deleteBookmark(BookmarkDto bookMarkDto);
    int delete(String bmid);
    BookmarkDto select(String mid);
    int checkBookmark(BookmarkDto bookMarkDto);
    int insert(BookmarkDto bookMarkDto);
}
