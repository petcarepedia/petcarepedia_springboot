package com.project.petcarepedia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {

    /* 병원 메인 페이지 */
    /*@GetMapping("hospital/{page}")
    public String hospital_list(@PathVariable String page, Model model){
        model.addAttribute("list");
        model.addAttribute("page", page);

        return "admin/hospital/admin_hospital_list";
    }*/
}
