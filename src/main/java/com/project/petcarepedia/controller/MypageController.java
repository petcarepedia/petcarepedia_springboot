package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.BookingDto;
import com.project.petcarepedia.dto.MemberDto;
import com.project.petcarepedia.dto.SessionDto;
import com.project.petcarepedia.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class MypageController {
    @Autowired
    private BookmarkService bookmarkService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private BookingService bookingService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private PageService pageService;
    @Autowired
    private FileUploadService fileService;

    @GetMapping("mypage_member_information")
    public String mypage_member_information(HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        MemberDto memberDto = memberService.content(svo.getMid());
        model.addAttribute("member", memberDto);
        return "/mypage/mypage_member_information";
    }

    @PostMapping("member_update")
    public String member_update(MemberDto memberDto) throws Exception{
        String viewName = "";
        int result = memberService.update(fileService.mfileCheck(memberDto));
        String oldFileName = memberDto.getMsfile();
        if(result == 1) {
            if(!memberDto.getFile1().isEmpty()) {
                fileService.mfileSave(memberDto);
                fileService.mfileDelete(oldFileName);
            }
            viewName = "redirect:/mypage_member_information";
        }
        return viewName;
    }

    @GetMapping("mypage_reservation")
    public String mypage_reservation(HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        ArrayList<BookingDto> list = bookingService.search2(svo.getMid());
        ArrayList<BookingDto> list2 = bookingService.search4(svo.getMid());
        model.addAttribute("list", list);
        model.addAttribute("list2", list2);
        return "/mypage/mypage_reservation";
    }

    @GetMapping("mypage_reservation_delete/{bid}")
    public String mypage_reservation_delete(@PathVariable String bid, Model model) {
        model.addAttribute("booking", bookingService.select2(bid));
        return "/mypage/mypage_reservation_delete";
    }

}
