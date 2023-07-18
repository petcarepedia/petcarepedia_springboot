package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.HospitalDto;
import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {

    @Autowired
    HospitalService hospitalService;
    @Autowired
    MemberService memberService;
    @Autowired
    BookingService bookingServcie;
    @Autowired
    ReviewService reviewService;
    @Autowired
    PageService pageService;

    @GetMapping
    public String review

    @GetMapping("reserve_list/{page}/")
    public String reserve_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "reserve"));
        model.addAttribute("list", bookingServcie.Blist(pageDto));
        model.addAttribute("page", page);
        return "admin/reserve/admin_reserve_list";
    }

    @GetMapping("member_content/{mid}/{page}/")
    public String member_content(@PathVariable String mid, @PathVariable String page, Model model){
        model.addAttribute("content", memberService.content(mid));
        model.addAttribute("page", page);
        return "admin/member/admin_member_detail";
    }

    @GetMapping("member_list/{page}/")
    public String member_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "member"));
        model.addAttribute("list", memberService.mslist(pageDto));
        model.addAttribute("page", page);
        return "admin/member/admin_member_list";
    }

    @GetMapping("hospital_delete/{hid}/")
    public String hospital_delete(@PathVariable String hid, Model model){
        model.addAttribute("hospital", hospitalService.delete(hid));
        return "admin/hospital/admin_hospital_delete";
    }

    @GetMapping("hospital_update/{hid}/{page}/")
    public String hospital_update(@PathVariable String page, HospitalDto hospitalDto, Model model){
        model.addAttribute("hospital", hospitalService.update(hospitalDto));
        model.addAttribute("page", page);

        return "admin/hospital/admin_hospital_update";
    }

    /* 병원 등록 페이지 */
    @GetMapping("hospital_write")
    public String hospital_wirte(){
        return "admin/hospital/admin_hospital_detail";
    }

    /* 병원 상세 페이지 */
    @GetMapping("hospital_content/{hid}/{page}/")
    public String hospital_content(@PathVariable String hid, @PathVariable String page, Model model){
        model.addAttribute("hospital", hospitalService.select(hid));
        model.addAttribute("page", page);

        return "admin/hospital/admin_hospital_content";
    }


    /* 병원 메인 페이지 */
    @GetMapping("hospital/{page}/")
    public String hospital_list(@PathVariable String page,Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "hospital"));
        model.addAttribute("list", hospitalService.Hlist(pageDto));
        model.addAttribute("page", page);

        return "admin/hospital/admin_hospital_list";
    }
}
