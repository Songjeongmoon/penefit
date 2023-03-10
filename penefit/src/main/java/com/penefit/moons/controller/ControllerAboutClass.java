package com.penefit.moons.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public void getClassList(Model model, int pageNum, int start) {
		if(start < 1) {
			start=1;
		}else if(start < 1 || pageNum < 1) {
			start = 1;
			pageNum = 1;
		}
		
		ArrayList<ClassVO> list = service.getClassList((pageNum * 8 - 8));
		int count = service.countClass();
		
		model.addAttribute("count", count);			
		model.addAttribute("list", list);							
		model.addAttribute("pstart", start);
	
	}

	// 진행중인 목록 ---
	@GetMapping("/classList-ongoing")
	public void getClassList1(Model model, int pageNum, int start) {
		if(start < 1) {
			start=1;
		}else if(start < 1 || pageNum < 1) {
			start = 1;
			pageNum = 1;
		}
		
		ArrayList<ClassVO> list = service.getOngoingClassList((pageNum * 8 - 8));
		int count = service.countOngingClass();	
		
		model.addAttribute("count", count);			
		model.addAttribute("list", list);							
		model.addAttribute("pstart", start);
	
	}
	
	// 마감된 목록	---
	@GetMapping("/classList-expired")
	public void getClassExpired(Model model, int pageNum, int start) {
	
		if(start < 1) {
			start=1;
		}else if(start < 1 || pageNum < 1) {
			start = 1;
			pageNum = 1;
		}
		
		ArrayList<ClassVO> list = service.getExpiredClassList((pageNum * 8 - 8));
		int count = service.expiredClassCount();	
		
		model.addAttribute("count", count);			
		model.addAttribute("list", list);							
		model.addAttribute("pstart", start);
	
	}
		

	// 카테고리별 클래스 목록
	@GetMapping("/classList-category")
	public void getCtgClassList(Model model, String key, int pageNum, int start) {
	
		if(start < 1) {
			start=1;
		}else if(start < 1 || pageNum < 1) {
			start = 1;
			pageNum = 1;
		}
		
		ArrayList<ClassVO> list = service.getCtgClassList(key, (pageNum * 8 - 8));
		int count = service.ctgClassCount(key);
		
		model.addAttribute("key", key);
		model.addAttribute("count", count);			
		model.addAttribute("list", list);							
		model.addAttribute("pstart", start);
	}
	
	
	

	// 신규 클래스 목록
	@GetMapping("/classList-new")
	public void getNewClassList(Model model) {
		ArrayList<ClassVO> list = service.getNewClassList();
		model.addAttribute("list", list);
	}

	// 검색된 클래스 목록
	@GetMapping("/classList-search")
	public String getSearchClassList(Model model, @RequestParam("keyword") String keyword, int pageNum, int start) {
		if(start < 1) {
			start=1;
		}else if(start < 1 || pageNum < 1) {
			start = 1;
			pageNum = 1;
		}
		
		System.out.println("keyword : " + keyword);
		ArrayList<ClassVO> list = service.getSearchClassList(keyword, (pageNum * 8 - 8));
		int cnt = service.getSearchClassListCnt(keyword);
		int result;
		if(cnt % 8 == 0) {
			result = cnt / 8;
		}else {
			result = cnt / 8 + 1;
		}
		
		model.addAttribute("pstart", start);
		model.addAttribute("result", result);
		model.addAttribute("list", list);							
		model.addAttribute("cnt", cnt);	
		model.addAttribute("keyword", keyword);
	
		
		return "/class/classList-search";
		
	}
	
	// 클래스 상세보기
	@GetMapping("/class-detail")
	public void selectClassOne(Model model, String class_code, HttpSession session) throws Exception {
		ClassVO cvo = service.selectClassOne(class_code);
		List<ReviewVO> rvo = service.getReview(class_code);
		
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = dateFormat.parse(cvo.getClass_date());
		Date date2 = dateFormat.parse(formatedNow);
		if (date1.before(date2)) {
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
	public String regFormView(HttpServletResponse res, Model model, HttpSession session, String class_code, int buy_history_num) {
		String member_id = (String) session.getAttribute("member_id");
		ClassVO result = null;
		try {
			res.setContentType("text/html; charset=UTF-8");
			result = service.reviewCheck(class_code);
			PrintWriter out = res.getWriter();
			if(result == null) {
				out.println("<script>alert('강의시간이 지난후 리뷰작성이 가능합니다.'); history.back()</script>");
				out.close();
			} else {
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
			model.addAttribute("m", member_id);
			model.addAttribute("buy_history_num", buy_history_num);
			model.addAttribute("classinfo", result);
			return "/class/reviewForm";
		
	}

	// 리뷰등록
	@PostMapping("/reviewList")
	public String regReview(ReviewVO review, MultipartFile file, HttpServletRequest request, HttpSession session) {
		// 필요한 정보받기
		String member_id = (String) session.getAttribute("member_id");
		Double class_score = review.getScore();
		String teacher_id = service.getTeacherId(review.getClass_code());
		Double member_score = service.getScore(teacher_id);
		String path = System.getProperty("user.dir") + "\\src\\main\\webapp\\images";
		// 사진을 저장하기
		File saveFile = new File(path, file.getOriginalFilename());
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		review.setReview_photo(file.getOriginalFilename());
		// 리뷰를 등록하기
		service.addReview(review.getBuy_history_num(), review.getReview_photo(), review.getClass_code(), review.getReview_content(), member_id,
				class_score);
		// 선생님 평점을 바꾸기
		if (member_score == 0) {
			service.addScore(class_score, teacher_id);
		} else {
			service.updateScore(class_score, teacher_id);
		}
		return "redirect:/member/infoMember";
	}

}
