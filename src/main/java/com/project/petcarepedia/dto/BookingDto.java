package com.project.petcarepedia.dto;

import lombok.Data;

@Data
public class BookingDto {
    String bid, bdate, vdate, vtime, bstate, mid, hid;
    int rno;

    /** 추가 **/
    String hname, loc, gloc, tel, hrink;
    String start, end;
    String img, hsfile;
    int count;
}
