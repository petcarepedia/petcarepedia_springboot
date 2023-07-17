package com.project.petcarepedia.dto;

import lombok.Data;

@Data
public class BookmarkDto {
    String bmid, hid, mid;
    //조인컬럼
    String hname, gloc, hrink;

    int rno;
}
