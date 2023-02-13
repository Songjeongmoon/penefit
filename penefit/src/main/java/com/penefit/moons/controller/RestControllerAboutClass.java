package com.penefit.moons.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.penefit.moons.domain.CartVO;
import com.penefit.moons.domain.WishlistVO;
import com.penefit.moons.service.ServiceAboutClass;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class RestControllerAboutClass {

	@Autowired
	ServiceAboutClass service;

	//class-detail페이지에 찜목록 확인
	@GetMapping("/checkWishlist")
	public int checkWishlist(@RequestParam String class_code, @RequestParam String member_id) {
		int result = service.checkWishlist(class_code, member_id);
		return result;
	}

	//class-detail페이지에서 추가
	@PostMapping("/addWishlist")
	public void addWishlist(@RequestBody WishlistVO wish) {
		service.addWishlist(wish);

	}

	//class-detail페이지에서 삭제
	@DeleteMapping("/deleteWishlist/class-code/{class_code}")
	public void deleteWishlist(@PathVariable(value = "class_code") String class_code, HttpSession session) {
		String member_id=(String) session.getAttribute("member_id");
		log.info("===================================");
		log.info(member_id);
		service.deleteWishlist(class_code, member_id);
	}
	
	//장바구니에서 삭제
	@DeleteMapping("/deleteCart/cartNum/{cartNum}")
	public void deleteCart(@PathVariable(value = "cartNum") int cartNum) {
		service.deleteFromCart(cartNum);
	}

	//위시리시트 페이지에서 삭제
	@DeleteMapping("/wishlist2")
	public void wishlistOut(HttpSession session, @RequestParam int wishNum) {
		WishlistVO wish = new WishlistVO();
		String member_id = (String) session.getAttribute("member_id");
		wish.setWishlist_num(wishNum);
		wish.setMember_id(member_id);
		service.deleteWishlist2(wish);
	}
	
	// 위시리스트 목록
	@GetMapping("/wishlist3")
	public ArrayList<WishlistVO> goWishlist2(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		ArrayList<WishlistVO> list = service.getWishlist(member_id);
		return list;
	}
	
	//장바구니 리스트
	@GetMapping("/shoppingcartList")
	public ArrayList<CartVO> shoppingcartList(HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		ArrayList<CartVO> list = service.getShoppingcartList(member_id);
		return list;
	}
	
	//장바구니에서 전체삭제
	@DeleteMapping("/allCart")
	public void deleteAllCart(HttpSession session ) {
		String member_id = (String) session.getAttribute("member_id");
		service.deleteAllFromCart(member_id);
	}
	

	
	
}
