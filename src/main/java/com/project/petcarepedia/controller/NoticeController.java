package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.NoticeDto;
import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.service.NoticeService;
import com.project.petcarepedia.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @Autowired
    private PageService pageService;

    //notice.do 관리자 공지사항 리스트 페이징

    @GetMapping("admin_notice/{page}")
    public String admin_notice(@PathVariable String page, Model model) {
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "notice"));
        model.addAttribute("list", noticeService.listPage(pageDto));
        model.addAttribute("page",pageDto);
        return("/admin/notice/admin_notice");
    }

    // admin_notice_content.do 관리자 공지사항 상세보기 페이지
    @GetMapping("admin_notice_content/{nid}/{page}")
    public String admin_notice_content(@PathVariable String nid, @PathVariable String page, Model model) {
        NoticeDto noticeDto = noticeService.enter_content(nid);
        noticeDto.setNcontent(noticeDto.getNcontent().replace("\n", "<br>"));
        model.addAttribute("nvo",noticeDto);
        model.addAttribute("page",page);
        return ("/admin/notice/admin_notice_content");
    }

    //admin_notice_write.do 관리자 공지사항 작성 페이지
    @GetMapping("admin_notice_write")
    public String admin_notice_write() {
        return("/admin/notice/admin_notice_write");
    }

    //admin_notice_write_proc.do 관리자 공지사항 작성 처리
    @PostMapping("admin_notice_write")
    public String admin_notice_write_proc(NoticeDto noticeDto) throws Exception {
        int result = noticeService.insert(noticeDto);
        String view = "";
        if(result == 1) {
            view = "redirect:/admin_notice/1/";
        }
        return view;
    }


    //admin_notice_update.do 관리자 공지사항 수정 페이지
    @GetMapping("admin_notice_update/{nid}/{page}")
    public String admin_notice_update(@PathVariable String nid, @PathVariable String page, Model model) {
        model.addAttribute("nvo",noticeService.content(nid));
        model.addAttribute("page",page);
        return ("/admin/notice/admin_notice_update");
    }

    //admin_notice_update_proc.do 관리자 공지사항 수정 처리
    @PostMapping("admin_notice_update")
    public String admin_notice_update_proc(NoticeDto noticeDto) throws Exception {
        int result = noticeService.update(noticeDto);
        String view = "";
        if(result == 1) {
            view = "redirect:/admin_notice/"+noticeDto.getPage()+"/";
        }
        return view;
    }

    // admin_notice_delete_proc.do 관리자 공지사항 삭제 처리
    @PostMapping("admin_notice_delete")
    public String admin_notice_delete_proc(NoticeDto noticeDto) {
        String view = "";
        int result = noticeService.delete(noticeDto.getNid());
        if(result == 1) {
            view = "redirect:/admin_notice/"+noticeDto.getPage()+"/";
        }
        return view;
    }

    //notice.do 사용자 공지사항 리스트 페이징
    @GetMapping("notice/{page}")
    public String notice(@PathVariable String page, Model model) {
        PageDto pageDto = pageService.getPageResult(new PageDto(page,"notice"));
        model.addAttribute("list", noticeService.listPage(pageDto));
        model.addAttribute("page",pageDto);
        return ("/notice/notice");
    }

    // notice_content.do 사용자 공지사항 상세보기
    @GetMapping("notice_content/{nid}/{page}")
    public String notice_content(@PathVariable String nid, @PathVariable String page, Model model) {
        NoticeDto noticeDto = noticeService.enter_content(nid);
        noticeDto.setNcontent(noticeDto.getNcontent().replace("\n", "<br>"));
        if(noticeDto != null) {
            // 조회수 업데이트 DB
            noticeService.updateHits(nid);
        }
        model.addAttribute("nvo",noticeDto);
        model.addAttribute("page",page);
        return ("notice/notice_content");
    }
}
