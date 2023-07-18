package com.project.petcarepedia.controller;

import com.project.petcarepedia.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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


    /** search_main.do - 병원 리스트 출력하기 **/
    @GetMapping("search_main")
    public String search_main(Model model) {
        model.addAttribute("list", hospitalService.select());

        return "/search/search_main";
    }






   /*


    @GetMapping("board_list/{page}")
    public String board_list(@PathVariable String page, Model model) {
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "board"));

        model.addAttribute("list", boardService.list(pageDto));
        model.addAttribute("page", pageDto);

        return "/board/board_list";
    }



    *//** searchAreaProc.do - 지역구 병원 리스트 출력하기 **//*
    @RequestMapping(value="/searchAreaProc.do", method=RequestMethod.GET)
    public ModelAndView searchAreaProc(String gloc) {
        ModelAndView model = new ModelAndView();

        ArrayList<HospitalVo> list = hospitalService.searchGloc(gloc);

        model.addObject("list", list);
        model.setViewName("/search/search_main");

        return model;
    }


    *//** search_result.do - 병원 상세정보 **//*
    @RequestMapping(value = "/search_result.do", method = RequestMethod.GET)
    public ModelAndView search_result(String hid, HttpSession session, String rid, String filter) {

        ModelAndView model = new ModelAndView();

        // session
        SessionVo svo = (SessionVo)session.getAttribute("svo");
        String mid;
        if(svo == null) {
            mid = "";
        } else {
            mid = svo.getMid();
        }

        HospitalVo hospital = hospitalService.select(hid);
        HospitalVo star = hospitalService.selectStar(hid);
        BookingVo bookingVo = bookingService.getSelectTime(hid);
//		ArrayList<ReviewVo> RM_select = reviewService.getRM_select(hid);
        ArrayList<ReviewVo> RM_select = new ArrayList<ReviewVo>();

        model.addObject("hospital", hospital);
        model.addObject("star", star);
        model.addObject("time", bookingVo);
//	    model.addObject("RM_select", RM_select);

        /// filter
        if (filter == null) {
//	        filter = "basic"; // 기본값 설정
            RM_select = reviewService.getRM_select(hid);
        } else if (filter.equals("basic")) {
            RM_select = reviewService.getRM_select(hid);
        } else if (filter.equals("like")) {
            RM_select = reviewService.getRM_select2(hid);
        } else if (filter.equals("totalUp")) {
            RM_select = reviewService.getRM_select3(hid);
        } else if (filter.equals("totalDown")) {
            RM_select = reviewService.getRM_select4(hid);
        }
        model.addObject("filter", filter);

        // Check bookmark
        BookmarkVo bookmarkVo = new BookmarkVo();

        bookmarkVo.setHid(hid);
        bookmarkVo.setMid(mid);
        int bookmarkResult = bookmarkService.getCheckBookmark(bookmarkVo);
        model.addObject("bookmarkResult", bookmarkResult);

        // Check like
        ReviewLikeVo reviewLikeVo = new ReviewLikeVo();
        reviewLikeVo.setMid(mid);

        for (ReviewVo review : RM_select) {
            String targetRid = review.getRid();
            reviewLikeVo.setRid(targetRid);
            int likeresult = reviewLikeService.getIdCheck(reviewLikeVo);
            review.setLikeresult(likeresult);
        }
        model.addObject("RM_select", RM_select);

        model.setViewName("/search/search_result");

        return model;
    }



    *//** search_result_map.do - 병원 상세 지도 정보 **//*
    @RequestMapping(value="/search_result_map.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String search_result_map(String hid) {
        HospitalVo list = hospitalService.select(hid);

        JsonObject jobj = new JsonObject();
        jobj.addProperty("hid", list.getHid());
        jobj.addProperty("hname", list.getHname());
        jobj.addProperty("x", list.getX());
        jobj.addProperty("y", list.getY());

        return new Gson().toJson(jobj);
    }


    *//** search_reservation.do?hid=? **//*
    @RequestMapping(value="/search_reservation.do", method=RequestMethod.GET)
    public ModelAndView search_reservation(String hid) {
        ModelAndView model = new ModelAndView();

        HospitalVo hospitalVo = hospitalService.select(hid);
        BookingVo bookingVo = bookingService.getSelectTime(hid);

        model.addObject("hospital", hospitalVo);
        model.addObject("time", bookingVo);

        model.setViewName("/search/search_reservation");
        return model;
    }


    *//** reservationProc.do - 예약 처리 **//*
    @RequestMapping(value="reservationProc.do", method=RequestMethod.POST)
    @ResponseBody
    public String reservationProc(BookingVo bookingVo) {
        int check_result = bookingService.getCheckBooking(bookingVo);

        if(check_result == 0) {
            bookingService.getInsert(bookingVo);
            return "success";
        } else {
            return "fail"; // 중복있음
        }
    }


    *//** reviewCheckProc.do - 리뷰쓰기 처리 **//*
    @RequestMapping(value="reviewCheckProc.do", method=RequestMethod.POST)
    @ResponseBody
    public String reviewCheckProc(String hid, String mid) {
        String result = "";
        if(hid != "" && mid != "") {
            result = "success";
        } else {
            result = "fail";
        }

        return result;
    }


    *//** bookmarkProc.do - 북마크 처리 **//*
    @RequestMapping(value = "bookmarkProc.do", method = RequestMethod.POST)
    @ResponseBody
    public String bookmarkProc(BookmarkVo bookmarkVo, @RequestParam("hid") String hid) {
        int result = bookmarkService.getCheckBookmark(bookmarkVo);

        if (result == 0) {
            bookmarkService.getInsert(bookmarkVo);
            return "success";
        } else if (result == 1) {
            bookmarkService.getDeleteBookmark(bookmarkVo);
            return "fail";
        }

        return "";
    }


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
