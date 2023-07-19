package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.dto.ReviewDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {
    List<ReviewDto> RM_select(String hid);
    List<ReviewDto> RM_select2(String hid);
    List<ReviewDto> RM_select3(String hid);
    List<ReviewDto> RM_select4(String hid);
    List<ReviewDto> reportList();
    List<ReviewDto> RH_select(String hid);
    List<ReviewDto> list();
    List<ReviewDto> listPage(PageDto pageDto);
    List<ReviewDto> searchListPage(PageDto pageDto);
    int searchCount(String gloc);
    ReviewDto content(String rid);
    ReviewDto enter_content(String rid);
    int insert(ReviewDto reviewDto);
    int update(ReviewDto reviewDto);
    int report(String rid);
    int delete(String rid);
    List<ReviewDto> bestList(PageDto pageDto);
    int count();
    List<ReviewDto> my_select(String mid);
    int reportReview(String rid);
    int report2(String rid);
    List<ReviewDto> Mylist(PageDto pageDto);
    List<ReviewDto> Rlist(PageDto pageDto);
}
