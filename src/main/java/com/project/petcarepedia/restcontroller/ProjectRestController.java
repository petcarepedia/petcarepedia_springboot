package com.project.petcarepedia.restcontroller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.project.petcarepedia.dto.*;
import com.project.petcarepedia.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class ProjectRestController {
    @Autowired
    MemberService memberService;
    @Autowired
    HospitalService hospitalService;
    @Autowired
    BookingService bookingService;
    @Autowired
    BookmarkService bookmarkService;
    @Autowired
    ReviewLikeService reviewLikeService;
    @Autowired
    ReviewReportService reviewReportService;

    @GetMapping("pass_check/{mid}/{pass}")
    public String pass_check(@PathVariable String mid, @PathVariable String pass) {
        MemberDto memberDto = new MemberDto();
        memberDto.setMid(mid);
        memberDto.setPass(pass);
        return String.valueOf(memberService.checkPass(memberDto));
    }


    /** search_result_map - 병원 상세 지도 정보 **/
    @GetMapping("search_reseult_map")
    public String search_result_map(@PathVariable String hid) {
        HospitalDto list = hospitalService.select(hid);
/*
        JsonObject jobj = new JsonObject();
        jobj.addProperty("hid", list.getHid());
        jobj.addProperty("hname", list.getHname());
        jobj.addProperty("x", list.getX());
        jobj.addProperty("y", list.getY());

        return new Gson().toJson(jobj);*/
        return "";
    }


    /** reservationProc - 예약 처리 **/
    @PostMapping("reservation/{hid}")
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


    /** like - 좋아요 처리 **/
    @PostMapping("like")
    public String likeProc(ReviewLikeDto reviewLikeDto, @RequestParam("hid") String hid) {
        int like_result = reviewLikeService.idCheck(reviewLikeDto);

        if(like_result == 0) { //기록 없음
            reviewLikeService.likesUpID(reviewLikeDto);
            reviewLikeService.likesUp(reviewLikeDto);

            return "success";
        } else if(like_result == 1) { //기록 있음
            reviewLikeService.likesDownID(reviewLikeDto);
            reviewLikeService.likesDown(reviewLikeDto);

            return "fail";
        }

        return "error"; //오류
    }


    /** rstate - 신고하기 처리 -> 신고테이블 처리 **/
    @PostMapping("rstate")
    public String rstateProc(ReviewReportDto reviewReportDto) {
        //중복신고 체크
        int result = reviewReportService.reviewReportCheck(reviewReportDto);

        if(result == 0) { //신고 없음
            reviewReportService.reviewReport(reviewReportDto);

            return "success";
        } else if (result == 1) { //신고 있음
            return "fail";
        }

        return "error";
    }


}
