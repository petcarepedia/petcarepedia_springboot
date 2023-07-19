package com.project.petcarepedia.controller;

import com.project.petcarepedia.service.HospitalService;
import com.project.petcarepedia.service.ReviewService;
import com.project.petcarepedia.service.SPWordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class MainController {
    @Autowired
    ReviewService reviewService;

    @Autowired
    HospitalService hospitalService;

    @Autowired
    SPWordService spWordService;

    @GetMapping("main_search")
    public String main_search_proc(String hname, Model model){
        spWordService.insert(hname);
        List<Object> list = hospitalService.search(hname);

        model.addAttribute("list", list);
        model.addAttribute("size", list.size());
        model.addAttribute("shname", hname);

        return "search/search_main";
    }

    @GetMapping("best_review_list")
    public String best_review_list(){
        return "best_review_list";
    }

    @GetMapping("main_map")
    public String main_map(){
        return "main_map";
    }

    @GetMapping("error")
    public String error() {
        return "error";
    }
}
