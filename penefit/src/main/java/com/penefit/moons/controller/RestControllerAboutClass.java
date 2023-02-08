package com.penefit.moons.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.penefit.moons.domain.WishlistVO;
import com.penefit.moons.service.ServiceAboutClass;

@RestController
@RequestMapping("/class")
public class RestControllerAboutClass {

	@Autowired
	ServiceAboutClass service;

	@GetMapping("checkWishlist")
	public int checkWishlist(String class_code, String member_id) {
		int result = service.checkWishlist(class_code, member_id);
		return result;
	}

	@GetMapping("addWishlist")
	public void addWishlist(WishlistVO wish) {
		service.addWishlist(wish);
		
	}
	
	@GetMapping("deleteWishlist")
	public void deleteWishlist(WishlistVO wish) {
		service.deleteWishlist(wish);
	}

}
