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
    public String review_like_proc(ReviewLikeDto reviewLikeDto, PageDto pageDto, HttpSession session) {

    }
    @RequestMapping(value="/review_like_Proc.do", method=RequestMethod.POST)
    public ModelAndView review_like_Proc(ReviewLikeVo reviewLikeVo, String page, String filter_location, HttpSession session) {
        ModelAndView model = new ModelAndView();

        SessionVo sessionVo = (SessionVo) session.getAttribute("svo");
        reviewLikeVo.setMid(sessionVo.getMid());

        if(reviewLikeService.getIdCheck(reviewLikeVo) == 1) {
            reviewLikeService.getLikesDownID(reviewLikeVo);
            reviewLikeService.getLikesDown(reviewLikeVo);
        }
        else {
            reviewLikeService.getLikesUpID(reviewLikeVo);
            reviewLikeService.getLikesUp(reviewLikeVo);
        }
        if(filter_location != "") {
            model.addObject("filter_location", filter_location);
        }
        if(page != "") {
            model.addObject("page", page);
        }
        model.setViewName("redirect:/review_content.do?rid="+reviewLikeVo.getRid());

        return model;
    }



    //리뷰 검색 페이징
    @RequestMapping(value="/review_main_search.do", method=RequestMethod.GET)
    public ModelAndView review_search_Proc(String page, String filter_location, HttpSession session) {
        ModelAndView model = new ModelAndView();
        Map<String, Integer> param = pageService.getPageResultRS(page, "reviewSearch", filter_location);
		/*
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 7;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지
		int pageCount = 7;	//전체 페이지 수
		int dbCount = reviewService.getSearchRowCount(filter_location);	//DB에서 가져온 전체 행수
		*/
        //총 페이지 수 계산
		/*
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize;
		}
		*/
		/*
		//요청 페이지 계산
		if(page != null){
			reqPage = Integer.parseInt(page);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 7;
		}
		*/

        ArrayList<ReviewVo> list = reviewService.getSelectSearchList(param.get("startCount"), param.get("endCount"), filter_location);

        model.addObject("filter_location", filter_location);
        model.addObject("list", list);
        model.addObject("totals", param.get("dbCount"));
        model.addObject("pageSize", param.get("pageSize"));
        model.addObject("maxSize", param.get("maxSize"));
        model.addObject("page", param.get("page"));

        model.setViewName("/review/review_main_search");


        return model;
}
