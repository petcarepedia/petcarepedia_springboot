package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.repository.PageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PageService {
    @Autowired
    private PageMapper pageMapper;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private NoticeService noticeService;
    public PageDto getPageResult(PageDto pageDto) {

        //페이징 처리 - startCount, endCount 구하기
        int startCount = 0;
        int endCount = 0;
        int pageSize = 5;	//한페이지당 게시물 수
        int reqPage = 1;	//요청페이지
        int pageCount = 1;	//전체 페이지 수
        int dbCount = 0;	//DB에서 가져온 전체 행수
        if(pageDto.getServiceName().equals("My_review")) {
            dbCount = pageMapper.Myscount(pageDto);
            pageSize = 5;
        } else if(pageDto.getServiceName().equals("review")) {
            pageCount = 7;
            dbCount = reviewService.count();
        }
        else if(pageDto.getServiceName().equals("reviewSearch")) {
            pageCount = 7;
            dbCount = reviewService.searchCount(pageDto.getGloc());
        }
        else if(pageDto.getServiceName().equals("notice")) {
            pageCount = 10;
            dbCount = noticeService.count();
        }
        else if(pageDto.getServiceName().equals("best_review")) {
            pageSize = 3;
            dbCount = pageMapper.Rcount();
            if(dbCount>9) dbCount=9;
        }

        //총 페이지 수 계산
        if(dbCount % pageSize == 0){
            pageCount = dbCount/pageSize;
        }else{
            pageCount = dbCount/pageSize+1;
        }

        //요청 페이지 계산
        if(pageDto.getPage() != null){
            reqPage = Integer.parseInt(pageDto.getPage());
            startCount = (reqPage-1) * pageSize+1;
            endCount = reqPage *pageSize;
        }else{
            startCount = 1;
            endCount = pageSize;
        }

        pageDto.setStartCount(startCount);
        pageDto.setEndCount(endCount);
        pageDto.setDbCount(dbCount);
        pageDto.setPageCount(pageCount);
        pageDto.setPageSize(pageSize);
        pageDto.setReqPage(reqPage);

        return pageDto;
    }
}
