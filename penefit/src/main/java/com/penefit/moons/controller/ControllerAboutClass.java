package com.penefit.moons.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//github.com/eseo99/penefit.git

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.service.ServiceAboutClassI;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/class")
public class ControllerAboutClass {
	@Autowired
	ServiceAboutClassI service;

	// 전체클래스
	@GetMapping("/classList")
	public void getClassList(Model model) {
		ArrayList<ClassVO> list = service.getClassList();
		model.addAttribute("list", list);
	}

	// 진행중인 목록
	@GetMapping("/classList-ongoing")
	public void getClassList1(Model model) {
		ArrayList<ClassVO> list = service.getOngoingClassList();
		model.addAttribute("list", list);
	}

	// 마감된 목록
	@GetMapping("/classList-expired")
	public void getClassExpired(Model model) {
		ArrayList<ClassVO> list = service.getExpiredClassList();
		model.addAttribute("list", list);
	}

	// 카테고리별 클래스 목록
	@GetMapping("/classList-category")
	public void getCtgClassList(Model model, String key) {
		ArrayList<ClassVO> list = service.getCtgClassList(key);
		model.addAttribute("list", list);
	}

	// 신규 클래스 목록
	@GetMapping("/classList-new")
	public void getNewClassList(Model model) {
		ArrayList<ClassVO> list = service.getNewClassList();
		model.addAttribute("list", list);
	}

	// 검색된 클래스 목록
	@GetMapping("/classList-search")
	public void getSearchClassList(Model model, String keyword) {
		ArrayList<ClassVO> list = service.getSearchClassList(keyword);
		model.addAttribute("list", list);
		int result = service.getSearchClassListCnt(keyword);
		model.addAttribute("result", result);
		model.addAttribute("keyword", keyword);
	}

	// 클래스 상세보기
	@GetMapping("/class-detail")
	public void selectClassOne(Model model, String class_code, HttpSession session) throws Exception {
		ClassVO cvo = service.selectClassOne(class_code);
		ReviewVO rvo = service.getReview(class_code);
		 LocalDateTime now = LocalDateTime.now();
		 String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = dateFormat.parse(cvo.getClass_date());
		Date date2 = dateFormat.parse(formatedNow);
		//System.out.println("Date-1: " + dateFormat.format(date1));
		//System.out.println("Date-2: " + dateFormat.format(date2));
		if(date1.before(date2)){
			model.addAttribute("status", "마감");
        } else {
        	model.addAttribute("status", "진행");
        }
		model.addAttribute("rvo", rvo);
		model.addAttribute("cvo", cvo);
	}

	// 장바구니에 담고 --> 리스트와 함께 페이지로 이동
	@GetMapping("/shoppingcart")
	public String shoppingcart(String class_code, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		int result = service.checkCcodeInCart(class_code, member_id);
		int cntResult = service.checkCntInCart(member_id);
		
		if (result == 1 || cntResult > 3) {
			// alert필요!
		} else {
			service.addShoppingcart(class_code, member_id);
		}
		return "redirect:../shoppingcart1";
	}

	// 리뷰 등록하기 페이지로
	@GetMapping("/reviewForm")
	public void regFormView(Model model, HttpSession session, String class_code) {
		String member_id = (String) session.getAttribute("member_id");
		ClassVO classinfo = service.selectClassOne(class_code);
		model.addAttribute("m", member_id);
		model.addAttribute("classinfo", classinfo);
	}

	// 리뷰등록
	@GetMapping("/reviewList")
	public String regReview(String class_code, String review_content, String score, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		int class_score = Integer.parseInt(score);
		service.addReview(class_code, review_content, member_id, class_score);
		String teacher_id = service.getTeacherId(class_code);
		int member_score = service.getScore(teacher_id);
		if (member_score == 0) {
			service.addScore(class_score, teacher_id);
		} else {
			service.updateScore(class_score, teacher_id);
		}
		return "redirect:/member/infoMember";
	}

}
