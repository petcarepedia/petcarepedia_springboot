package com.project.petcarepedia.dto;

import lombok.Data;

@Data
public class NoticeDto {
    private String nid, title, ndate, ncontent;
    private int rno,nhits;
    private String page;

}
