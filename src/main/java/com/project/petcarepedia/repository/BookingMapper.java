package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.BookingDto;
import com.project.petcarepedia.dto.BookingReviewDto;
import com.project.petcarepedia.dto.PageDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface BookingMapper {
    int insert(BookingDto bookingDto);
    int checkBooking(BookingDto bookingDto);
    ArrayList<BookingDto> select();
    BookingDto select2(String bid);
    ArrayList<BookingDto> search(String mid);
    ArrayList<BookingDto> search1(String mid);
    ArrayList<BookingDto> search2(String mid);
    ArrayList<BookingReviewDto> search3(String mid);
    ArrayList<BookingDto> search4(String mid);
    ArrayList<BookingDto> search5(String mid);
    BookingDto reviewCheck(String hid, String mid);
    ArrayList<BookingDto> selectTime();
    BookingDto selectTime2(String hid);
    int update(BookingDto bookingDto);
    int delete(String bid);
    int Bselect(String bid);

    /*page_mapper*/
    List<BookingDto> Bslist(PageDto pageDto, String mid);
    List<BookingDto> Blist(PageDto pageDto);

}
