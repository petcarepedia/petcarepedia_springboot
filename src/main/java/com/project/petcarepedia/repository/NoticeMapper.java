package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.NoticeDto;
import com.project.petcarepedia.dto.PageDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {
    List<NoticeDto> list();
    NoticeDto content(String nid);
    NoticeDto enter_content(String nid);
    int insert(NoticeDto noticeDto);
    int update(NoticeDto noticeDto);
    int delete(String nid);
    void updateHits(String nid);
    int count();
    List<NoticeDto> listPage(PageDto pageDto);
}
