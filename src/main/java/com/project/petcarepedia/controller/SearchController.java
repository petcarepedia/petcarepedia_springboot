package com.project.petcarepedia.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.project.petcarepedia.dto.*;
import com.project.petcarepedia.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.util.ArrayList;

@Controller
public class SearchController {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private BookmarkService bookmarkService;
    @Autowired
    private HospitalService hospitalService;
    @Autowired
    private ReviewLikeService reviewLikeService;
    @Autowired
    private ReviewReportService reviewReportService;
    @Autowired
    private ReviewService reviewService;


    /** search_main - 병원 리스트 출력하기 **/
    @GetMapping("search_main")
    public String search_main(Model model) {
        model.addAttribute("list", hospitalService.select());

        return "/search/search_main";
    }


    /** search_result - 병원 상세정보 **/
    @GetMapping("search_result/{hid}/{filter}")
    public String search_result(@PathVariable String hid, String rid, String filter, HttpSession session, Model model) {

        //session
        SessionDto svo = (SessionDto) session.getAttribute("svo");

        String mid;
        if(svo == null) {
            mid = "";
        } else {
            mid = svo.getMid();
        }

        model.addAttribute("hospitcal", hospitalService.select(hid)); //병원 정보 출력
        model.addAttribute("star", hospitalService.selectStar(hid)); //병원 별점 출력
        model.addAttribute("time", bookingService.selectTime2(hid)); //영업시간 출력

        //filter
        ArrayList<ReviewDto> RM_select = new ArrayList<>();

        if(filter == null) {
            RM_select = (ArrayList<ReviewDto>) reviewService.RM_select(hid);
        } else if(filter.equals("basic")) {
            RM_select = (ArrayList<ReviewDto>) reviewService.RM_select(hid);
        } else if(filter.equals("like")) {
            RM_select = (ArrayList<ReviewDto>) reviewService.RM_select2(hid);
        } else if(filter.equals("totalUp")) {
            RM_select = (ArrayList<ReviewDto>) reviewService.RM_select3(hid);
        } else if(filter.equals("totalDown")) {
            RM_select = (ArrayList<ReviewDto>) reviewService.RM_select4(hid);
        }

        model.addAttribute("filter", filter); // 리뷰 정렬 필터

        //check bookmark
        BookmarkDto bookmarkDto = new BookmarkDto();
        bookmarkDto.setHid(hid);
        bookmarkDto.setMid(mid);

        int bookmarkResult = bookmarkService.checkBookmark(bookmarkDto);
        model.addAttribute("bookmarkResult", bookmarkResult);

        //check like
        ReviewLikeDto reviewLikeDto = new ReviewLikeDto();
        reviewLikeDto.setMid(mid);

        for(ReviewDto review : RM_select) {
            String targetRid = review.getRid();
            reviewLikeDto.setRid(targetRid);
            int likeResult = reviewLikeService.idCheck(reviewLikeDto);
            review.setLikeresult(likeResult);
        }

        model.addAttribute("RM_select", RM_select);

        return "/search/search_result";
    }


    /** search_result_map - 병원 상세 지도 정보 **/
    @GetMapping("search_reseult_map")
    @ResponseBody
    public String search_result_map(@PathVariable String hid) {
        HospitalDto list = hospitalService.select(hid);

        JsonObject jobj = new JsonObject();
        jobj.addProperty("hid", list.getHid());
        jobj.addProperty("hname", list.getHname());
        jobj.addProperty("x", list.getX());
        jobj.addProperty("y", list.getY());

        return new Gson().toJson(jobj);
    }


    /** search_reservation **/
    @GetMapping("search_reservation/{hid}")
    public String search_reservation(@PathVariable String hid, Model model) {
        model.addAttribute("hospital", hospitalService.select(hid));
        model.addAttribute("time", bookingService.selectTime2(hid));

        return "/search/search_reservation";
    }


    /** reservationProc - 예약 처리 **/
    @PostMapping("reservation")
    @ResponseBody
    public String reservationProc(BookingDto bookingDto) {
        int check_result = bookingService.checkBooking(bookingDto);

        if(check_result == 0) {
            bookingService.insert(bookingDto);
            return "success";
        } else if(check_result == 1) {
            return "fail"; //중복예약
        }

        return "error"; //오류
    }


    /** bookmark - 북마크 처리 **/
    @PostMapping("bookmark")
    @ResponseBody
    public String bookmarkProc(BookmarkDto bookmarkDto, @RequestParam("hid") String hid) {
        int result = bookmarkService.checkBookmark(bookmarkDto);
        
        if (result == 0) { //북마크 없을 때
            bookmarkService.insert(bookmarkDto);
            return "success";
        } else if (result == 1) { //북마크 있을 때
            bookmarkService.deleteBookmark(bookmarkDto);
            return "fail";
        }
        
        return "error"; //오류
    }


   /*
    @GetMapping("board_list/{page}")
    public String board_list(@PathVariable String page, Model model) {
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "board"));

        model.addAttribute("list", boardService.list(pageDto));
        model.addAttribute("page", pageDto);

        return "/board/board_list";
    }
    ---------------------------------------------------------------------------------------

    *//** likeProc.do - 좋아요 처리 **//*
    @RequestMapping(value="likeProc.do", method=RequestMethod.POST)
    @ResponseBody
    public String likeProc(ReviewLikeVo reviewLikeVo, @RequestParam("hid") String hid) {
        int like_result = reviewLikeService.getIdCheck(reviewLikeVo);

        if (like_result == 0) { // 기록 없음
            reviewLikeService.getLikesUpID(reviewLikeVo);
            reviewLikeService.getLikesUp(reviewLikeVo);
            return "success";
        } else { // 기록 있음
            reviewLikeService.getLikesDownID(reviewLikeVo);
            reviewLikeService.getLikesDown(reviewLikeVo);
            return "fail";
        }
    }


    *//** rstateForm.do - 신고하기 처리 **//*
//	@RequestMapping(value="rstateProc.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String rstateProc(String rid, @RequestParam("hid") String hid) {
//	    int rstate_result = reviewService.reviewCheckResult(rid);
//
//	    if (rstate_result == 0) {
//	    	reviewService.getUpdateReport(rid);
//	    	return "success";
//		} else if (rstate_result == 1) {
//			return "fail";
//		}
//
//	    return "";
//	}


    *//** rstateForm.do - 신고하기 처리 -> 신고테이블 처리 **//*
    @RequestMapping(value="rstateProc.do", method=RequestMethod.POST)
    @ResponseBody
    public String rstateProc(ReviewReportVo reviewReportVo) {
        // 중복 신고 체크 여부
        int result = reviewReportService.getReiviewReportCheck(reviewReportVo);

        if(result == 0) {
            reviewReportService.getReviewReport(reviewReportVo);
            return "success";
        } else { // 중복신고
            return "fail";
        }

    }



    *//** search_map.do **//*
    @RequestMapping(value="/search_map.do", method=RequestMethod.GET)
    public String search_map() {
        return "/search/search_map";
    }


    *//** search_main_map.do **//*
    @RequestMapping(value="/search_main_map.do", method=RequestMethod.GET)
    public String search_main_map() {
        return "/search/search_main_map";
    }


    *//** map_data.do **//*
    @RequestMapping(value="/map_data.do",method=RequestMethod.GET,produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String map_data(String gloc) {
        ArrayList<HospitalVo> list = hospitalService.searchGloc(gloc);

        JsonObject jlist = new JsonObject();
        JsonArray jarray = new JsonArray();

        for(HospitalVo hospitalVo : list) {
            JsonObject jobj = new JsonObject(); //{}
            jobj.addProperty("hid", hospitalVo.getHid());
            jobj.addProperty("hname", hospitalVo.getHname());
            jobj.addProperty("gloc", hospitalVo.getGloc());
            jobj.addProperty("loc", hospitalVo.getLoc());
            jobj.addProperty("tel", hospitalVo.getTel());
            jobj.addProperty("htime", hospitalVo.getHtime());
            jobj.addProperty("ntime", hospitalVo.getNtime());
            jobj.addProperty("holiday", hospitalVo.getHoliday());
            jobj.addProperty("animal", hospitalVo.getAnimal());
            jobj.addProperty("x", hospitalVo.getX());
            jobj.addProperty("y", hospitalVo.getY());

            jarray.add(jobj);
        }

        jlist.add("jlist", jarray);

        return new Gson().toJson(jlist);
    }
    */



}
