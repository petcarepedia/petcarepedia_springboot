package com.project.petcarepedia.restcontroller;

import com.project.petcarepedia.dto.MemberDto;
import com.project.petcarepedia.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProjectRestController {
    @Autowired
    MemberService memberService;

    @GetMapping("pass_check/{mid}/{pass}")
    public String pass_check(@PathVariable String mid, @PathVariable String pass) {
        MemberDto memberDto = new MemberDto();
        memberDto.setMid(mid);
        memberDto.setPass(pass);
        return String.valueOf(memberService.checkPass(memberDto));
    }
}
