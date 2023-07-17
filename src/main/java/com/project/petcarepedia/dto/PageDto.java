package com.project.petcarepedia.dto;

import lombok.Data;

@Data
public class PageDto {
    private final String page;
    private final String serviceName;
    private int startCount;
    private int endCount;
    private int dbCount;
    private int pageSize;
    private int pageCount;
    private int reqPage;
    private String gloc;
    private String mid;
    private String hname;

}
