package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.MemberDto;
import com.project.petcarepedia.dto.SessionDto;
import com.project.petcarepedia.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
    @Autowired
    MemberService memberService;

    /**
     * 로그인
     */
    @GetMapping("login")
    public String login(){ return "/login/login"; }

    @PostMapping("login")
    public String login_proc(MemberDto memberDto, String rememberId, Model model, HttpSession session, HttpServletResponse response){
        String viewName = "index";

        SessionDto sessionDto = memberService.login(memberDto);
        if(sessionDto != null) {

            if(sessionDto.getLoginResult() == 1){
                session.setAttribute("svo", sessionDto);

                Cookie cookie = new Cookie("user_check", sessionDto.getMid());
                if(rememberId.equals("true")){
                    response.addCookie(cookie);
                } else {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }

                model.addAttribute("login_result", "success");
                viewName = "/login/login";
            }
        } else {
            model.addAttribute("login_result", "fail");
            viewName = "/login/login";
        }

        return viewName;
    }

    /**
     * 로그아웃
     */
    @GetMapping("logout")
    public String logout(HttpSession session, Model model) {
        SessionDto sessionDto = (SessionDto)session.getAttribute("svo");
        if(sessionDto != null) {
            session.invalidate();
            model.addAttribute("logout_result","success");
        }

        return "redirect:/";
    }

    /**
     * 회원가입
     */
    @GetMapping("join_step1")
    public String join_step1(){ return "join/join_step1"; }

    @GetMapping("join_step2/{grade}")
    public String join_step2(@PathVariable String grade, Model model){
        model.addAttribute("grade", grade);
        return "join/join_step2";
    }

    @GetMapping("join_step3/{grade}")
    public String join_step3(@PathVariable String grade, Model model){
        model.addAttribute("grade", grade);
        return "join/join_step3";
    }

    @GetMapping("join_step4/{grade}/{email}")
    public String join_step4(@PathVariable String grade, @PathVariable String email, Model model){
        model.addAttribute("grade", grade);
        model.addAttribute("email", email);
        return "join/join_step4";
    }

    @PostMapping("join")
    public String join_proc(MemberDto memberDto, Model model){
        String viewName = "";

        if(memberService.join(memberDto) == 1){
            model.addAttribute("join_result", "success");
            viewName = "login/login";
        } else {
            model.addAttribute("join_result", "fail");
            viewName = "error";
        }

        return viewName;
    }

    /**
     * 아이디찾기
     */
    @GetMapping("find_id")
    public String find_id(){ return "login/login_idfind"; }
    @PostMapping("find_id")
    public String find_id_proc(MemberDto memberDto){
        String viewName = "";

        String mid = memberService.find(memberDto);
        if(!mid.equals("") && mid != null) {
            viewName = "login/login_idfind_success";
        } else viewName = "login/login_idfind_fail";

        return viewName;
    }

    @GetMapping("find_id_success")
    public String find_id_success(){ return "login/login_idfind_success"; }
    @GetMapping("find_id_fail")
    public String find_id_fail(){ return "login/login_idfind_fail"; }

    /**
     * 비밀번호찾기
     */
    @GetMapping("find_pw")
    public String find_pw(){ return "login/login_pwfind"; }
    @PostMapping("find_pw")
    public String find_pw_proc(MemberDto memberDto){
        String viewName = "";

        String mid = memberService.find(memberDto);
        if(!mid.equals("") && mid != null) {
            viewName = "login/login_pwupdate";
        } else viewName = "login/login_pwfind_fail";

        return viewName;
    }

    @GetMapping("find_pw_fail")
    public String find_pw_fail(){ return "login/login_pwfind_fail"; }

    /**
     * 비밀번호 재설정
     */
    @GetMapping("update_pw")
    public String update_pw(){ return "login/login_pwupdate"; }
    @PostMapping("update_pw")
    public String update_pw_proc(MemberDto memberDto, HttpSession session, Model model){
        String viewName = "";

        if(memberService.updatePass(memberDto) == 1){
            session.invalidate();
            model.addAttribute("pwupdate_result", "success");
            viewName = "login/login";
        } else {
            model.addAttribute("pwupdate_result", "fail");
            viewName = "error";
        }

        return viewName;
    }
}
