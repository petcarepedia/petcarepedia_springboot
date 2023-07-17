package com.project.petcarepedia.dto;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.ArrayList;
@Data
public class ReviewDto {
    // 리뷰에서 필요한 Vo
    private String rid, rcontent, rdate, rstate, hid, mid, hname, animal, gloc, rfile1, rsfile1, rfile2, rsfile2;
    private int rlike, rno, likeresult;
    private float rstar;
    private CommonsMultipartFile[] files;
    private ArrayList<String> rfiles = new ArrayList<String>();
    private ArrayList<String> rsfiles = new ArrayList<String>();

    //병원과 조인 Vo
    private String loc, tel, htime, ntime, holiday, intro, img, hrink;
    // 내가 쓴 리뷰
    private String bid, nickname;
    private String hsfile;
    private String msfile;

}
