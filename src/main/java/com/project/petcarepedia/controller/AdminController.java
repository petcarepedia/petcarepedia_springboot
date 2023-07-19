package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.*;
import com.project.petcarepedia.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
    @Autowired
    FileUploadService fileUploadService;

    /* 신고 리뷰 삭제 처리 */
    @PostMapping("review_delete")
    public String review_delete_proc(ReviewDto reviewDto){
        int result = reviewService.delete(reviewDto.getRid());
        return "redirect:/admin_review_list/";
    }

    /* 신고 리뷰 삭제 페이지 */
    @GetMapping("review_delete/{rid}/{page}")
    public String review_delete(@PathVariable String rid, @PathVariable String page, Model model){
        model.addAttribute("delete", reviewService.delete(rid));
        model.addAttribute("page", page);
        return "admin/review/admin_review_delete2";
    }
    
    /* 신고 리뷰 상세 페이지 */
    @GetMapping("review_content/{rid}/{page}")
    public String review_content(@PathVariable String rid, @PathVariable String page, Model model){
        model.addAttribute("content", reviewService.content(rid));
        model.addAttribute("page", page);
        return "admin/review/admin_review_detail";
    }
    
    /* 신고 리뷰 메인 페이지 */
    @GetMapping("review_list/{page}/")
    public String review_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto (page, "review2"));
        model.addAttribute("list", reviewService.Rlist(pageDto));
        model.addAttribute("page", pageDto);
        return "admin/review/admin_review_list";
    }
    
    /* 예약 메인 페이지 */
    @GetMapping("reserve_list/{page}/")
    public String reserve_list(@PathVariable String page, BookingDto bookingDto, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "reserve"));

        if(bookingDto.getMid() != null && bookingDto.getMid() != ""){
            model.addAttribute("list", bookingServcie.Bslist(pageDto));
            model.addAttribute("page", pageDto);
        }else{
            model.addAttribute("list", bookingServcie.Blist(pageDto));
            model.addAttribute("page", pageDto);
        }

        return "admin/reserve/admin_reserve_list";
    }
    
    /* 회원 상세 페이지 */
    @GetMapping("member_content/{mid}/{page}/")
    public String member_content(@PathVariable String mid, @PathVariable String page, Model model){
        model.addAttribute("content", memberService.content(mid));
        model.addAttribute("page", page);
        return "admin/member/admin_member_detail";
    }
    
    /* 회원 메인 페이지 */
    @GetMapping("member_list/{page}/")
    public String member_list(@PathVariable String page, MemberDto memberDto, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "member"));

        if(memberDto.getMid() != null && memberDto.getMid() != ""){
            model.addAttribute("list", memberService.mslist(pageDto));
            model.addAttribute("page", pageDto);
        }else{
            model.addAttribute("list", memberService.mlist(pageDto));
            model.addAttribute("page", pageDto);
        }

        return "admin/member/admin_member_list";
    }

    /* 병원 삭제 처리 */
    @PostMapping("hospital_delete")
    public String hospital_delete_proc(HospitalDto hospitalDto) throws Exception{
        String oldFileName = hospitalDto.getHsfile();
        hospitalDto = (HospitalDto)fileUploadService.fileCheck(hospitalDto);
        int result = hospitalService.delete(hospitalDto.getHid());
        if(result == 1){
            fileUploadService.fileDelete(oldFileName);
        }
        return "redirect:/admin_hospital_list/1/";
    }

    /* 병원 삭제 페이지 */
    @GetMapping("hospital_delete/{hid}/")
    public String hospital_delete(@PathVariable String hid, Model model){
        model.addAttribute("hospital", hospitalService.delete(hid));
        return "admin/hospital/admin_hospital_delete";
    }

    /* 병원 수정 처리 */
    @PostMapping("hospital_update")
    public String hospital_update_proc(HospitalDto hospitalDto) throws Exception{
        String oldFileName =hospitalDto.getHsfile();
        hospitalDto = (HospitalDto)fileUploadService.fileCheck(hospitalDto);
        int result = hospitalService.update(hospitalDto);
        if(result == 1){
            fileUploadService.fileDelete2(hospitalDto, oldFileName);
            fileUploadService.fileSave(hospitalDto);
        }

        return "redirect:/admin_hospital_list/"+hospitalDto.getPage()+"/";

    }

    /* 병원 수정 페이지 */
    @GetMapping("hospital_update/{hid}/{page}/")
    public String hospital_update(@PathVariable String page, HospitalDto hospitalDto, Model model){
        model.addAttribute("hospital", hospitalService.update(hospitalDto));
        model.addAttribute("page", page);

        return "admin/hospital/admin_hospital_update";
    }

    /* 병원 등록 처리 */
    @PostMapping("hospital_wirte")
    public String hospital_write_proc(HospitalDto hospitalDto) throws Exception{
        hospitalDto = (HospitalDto) fileUploadService.fileCheck(hospitalDto);
        int result = hospitalService.insert(hospitalDto);
        if(result == 1){
            fileUploadService.fileSave(hospitalDto);
        }
        return "redirect:/admin_hospital_list/1/";
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
    public String hospital_list(@PathVariable String page,HospitalDto hospitalDto, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "hospital"));

        if(hospitalDto.getHname() != null && hospitalDto.getHname() != ""){
            model.addAttribute("list", hospitalService.Hslist(pageDto));
            model.addAttribute("page", pageDto);
        }else if(hospitalDto.getGloc() != null && hospitalDto.getGloc() != ""){
            model.addAttribute("list", hospitalService.Hslist2(pageDto));
            model.addAttribute("page", pageDto);
        }else {
            model.addAttribute("list", hospitalService.Hlist(pageDto));
            model.addAttribute("page", pageDto);
        }

        return "admin/hospital/admin_hospital_list";
    }
}
