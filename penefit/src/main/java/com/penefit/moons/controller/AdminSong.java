package com.penefit.moons.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.service.AdminServiceSong;

@Controller
@RequestMapping("/admin")
class AdminSong {
	
	@Autowired
	AdminServiceSong service;
	
	@GetMapping("/registration")
	public String createClass() {
		return "registration";
	}
	

	
	
	
	@PostMapping("/registration")
	@ResponseBody
	public SuggestDTO regClass(String suggest_num) {
		
		SuggestDTO suggest = service.createClass(suggest_num);
		
		return suggest;
		
	}
	
	
	
	
}
