package com.penefit.moons.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//github.com/eseo99/penefit.git

import com.penefit.moons.domain.ClassVO;
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
	// 전체클래스
		@GetMapping("/test1")
		public void tesg1() {
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
	public void selectClassOne(Model model, String class_code, HttpSession session) {
		ClassVO cvo = service.selectClassOne(class_code);

		model.addAttribute("cvo", cvo);
	}

	// 장바구니에 담고 --> 리스트와 함께 페이지로 이동
	@GetMapping("/shoppingcart")
	public String shoppingcart(String class_code, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		int result = service.checkCcodeInCart(class_code, member_id);
		if (result == 1) {
			// alert필요!
		} else {
			service.addShoppingcart(class_code, member_id);
		}
		return "redirect:../shoppingcart1";
	}
	
	
	


}
