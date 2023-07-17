package com.project.petcarepedia.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class BoardDto {
    private String page;
    private int rno, bhits;
    private String bid, btitle, bcontent, id, bdate, bfile, bsfile;
    private MultipartFile file1; //폼에서 넘어오는 파일객체
}
