package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.*;
import com.project.petcarepedia.service.PageService;
import com.project.petcarepedia.service.ReviewLikeService;
import com.project.petcarepedia.service.ReviewService;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ReviewController {
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private ReviewLikeService reviewLikeService;
    @Autowired
    private PageService pageService;

    //review_main.do 리뷰 리스트 페이징
    @GetMapping("review_main/{page}")
    public String review_main(@PathVariable String page, Model model) {
        PageDto pageDto = pageService.getPageResult(new PageDto(page,"review"));
        model.addAttribute("list", reviewService.listPage(pageDto));
        model.addAttribute("page", pageDto);
        return ("/review/review_main");
    }

    //review_content.do 리뷰 상세 페이지
    @GetMapping("review_content/{rid}/{page]")
    public String review_content(@PathVariable String rid, @PathVariable String page, Model model, HttpSession session) {
        ReviewDto reviewDto = reviewService.enter_content(rid);
        ReviewLikeDto reviewLikeDto = new ReviewLikeDto();
        PageDto pageDto = new PageDto(page, "review");

        reviewDto.setRcontent(reviewDto.getRcontent().replace("\n", "<br>"));
        String mid ="";
        if(session.getAttribute("svo") != null) {
            SessionDto sessionDto = (SessionDto) session.getAttribute("svo");
            mid = sessionDto.getMid();
        }
        reviewLikeDto.setMid(mid);
        reviewLikeDto.setRid(rid);
        int likeResult = reviewLikeService.idCheck(reviewLikeDto);

        model.addAttribute("likeResult",likeResult);
        model.addAttribute("rvo",reviewDto);
        model.addAttribute("page",pageDto);
        return ("/review/review_content");
    }

    //review_content.do 리뷰 상세 페이지 - gloc 있을 때
    @GetMapping("review_content/{rid}/{page]/{gloc}")
    public String review_content(@PathVariable String rid, @PathVariable String page, @PathVariable String gloc, Model model, HttpSession session) {
        ReviewDto reviewDto = reviewService.enter_content(rid);
        ReviewLikeDto reviewLikeDto = new ReviewLikeDto();
        PageDto pageDto = new PageDto(page, "review");
        pageDto.setGloc(gloc);

        reviewDto.setRcontent(reviewDto.getRcontent().replace("\n", "<br>"));
        String mid ="";
        if(session.getAttribute("svo") != null) {
            SessionDto sessionDto = (SessionDto) session.getAttribute("svo");
            mid = sessionDto.getMid();
        }
        reviewLikeDto.setMid(mid);
        reviewLikeDto.setRid(rid);
        int likeResult = reviewLikeService.idCheck(reviewLikeDto);

        model.addAttribute("likeResult",likeResult);
        model.addAttribute("rvo",reviewDto);
        model.addAttribute("page",pageDto);
        return ("/review/review_content");
    }


    //review_delete_proc.do 리뷰 삭제 처리
    @GetMapping("review_delete")
    public String review_delete_proc(ReviewDto reviewDto) {
        int result = reviewService.delete(reviewDto.getRid());
        if(result == 1) {
            //파일 삭제 추가하기
        }
        return ("redirect:/review_main/"+reviewDto.getPage()+"/");
    }

    //review_report_check.do 리뷰 신고 체크 ----- restComtroller로 바꾸기
    /*
    @RequestMapping(value="/review_report_check.do", method=RequestMethod.GET)
    @ResponseBody
    public String review_report_check(String rid) {
        int result = reviewService.reviewCheckResult(rid);
        return String.valueOf(result);
    }
    */

    //review_report_proc.do 리뷰 신고 처리
    @PostMapping("review_report")
    public String review_report_proc(ReviewDto reviewDto) {
        int result = reviewService.report(reviewDto.getRid());
        String view ="";
        if(result == 1) {
            // 리뷰로 돌아가게하기
            view = "redirect:/review/review_main";
        }
        return view;
    }

    //리뷰 좋아요
    @PostMapping("review_like")
    public String review_like_proc(ReviewLikeDto reviewLikeDto, PageDto pageDto, HttpSession session, Model model) {
        SessionDto sessionDto = (SessionDto) session.getAttribute("svo");
        reviewLikeDto.setMid(sessionDto.getMid());

        if(reviewLikeService.idCheck(reviewLikeDto) == 1) {
            reviewLikeService.likesDownID(reviewLikeDto);
            reviewLikeService.likesDown(reviewLikeDto);
        }
        else {
            reviewLikeService.likesUpID(reviewLikeDto);
            reviewLikeService.likesUp(reviewLikeDto);
        }
        model.addAttribute("page", pageDto);
        return ("/review/review_content");
    }


    //리뷰 검색 페이징
    @GetMapping("review_main_search")
    public String review_main_search(String page, String gloc, HttpSession session, Model model) {
        PageDto pageDto = pageService.getPageResult(new PageDto(page,"reviewSearch"));
        pageDto.setGloc(gloc);
        model.addAttribute("list", reviewService.listPage(pageDto));
        model.addAttribute("page", pageDto);
        return ("/review/review_main_search");
    }
}
