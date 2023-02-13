package com.penefit.moons.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.penefit.moons.domain.CartVO;
import com.penefit.moons.domain.WishlistVO;
import com.penefit.moons.service.ServiceAboutClass;

@Controller
public class ControllerAboutRoot {
	@Autowired
	ServiceAboutClass service;

	@GetMapping("/")
	public String root() {
		return "home";
	}

	// 위시리스트 목록
	@GetMapping("wishlist")
	public String goWishlist(Model model, HttpSession session) {
		System.out.println("=============================");
		String member_id = (String) session.getAttribute("member_id");
		ArrayList<WishlistVO> list = service.getWishlist(member_id);
		model.addAttribute("list", list);
		return "wishlist";
	}
	
	 @GetMapping(value = {"shoppingcart2", "class/shoppingcart2"})
	public String shoppingcart2(HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("member_id");
		ArrayList<CartVO> list = service.getShoppingcartList(member_id);
		model.addAttribute("list", list);
		return "shoppingcart";
	}


}
