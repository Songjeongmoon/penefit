package com.penefit.moons.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.service.ServiceAboutClass;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ControllerAboutRoot {
	@Autowired
	ServiceAboutClass service;

	@GetMapping("/")
	public String root() {
		return "home";
	}

	// 위시리스트 목록
	@GetMapping("/wishlist")
	public void goWishlist() {
		
	}

	// 장바구니 담기 없이 바로 header클릭시 목록
	@GetMapping("/shoppingcart1")
	public String goCart(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		MemberVO member= service.getMemberInfo(member_id);
		model.addAttribute("memberinfo", member);
		return "shoppingcart";
	}

	// 마이페이지로
	@GetMapping("/infoMember")
	public String goInfoMember () {
		return "member/infoMember";
	}
}
