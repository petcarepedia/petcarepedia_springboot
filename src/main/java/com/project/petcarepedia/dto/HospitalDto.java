package com.project.petcarepedia.dto;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Data
public class HospitalDto {
    int rno;
    String hid, hname, gloc, loc, tel, htime, ntime, holiday, animal,intro, img, hrink, x, y, starttime, endtime, hfile, hsfile;
    float rstar;
    CommonsMultipartFile file1;
}
