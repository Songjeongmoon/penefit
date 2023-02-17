package com.penefit.moons.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.penefit.moons.service.AdminServiceChaeng;

@Controller
public class AdminChaengController {

	@Autowired
	AdminServiceChaeng serviceChaeng;
	
	@GetMapping("/adminReview")
	public void adminReview() {
		
	}
}
