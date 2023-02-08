package com.penefit.moons.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.service.ServiceAboutClassInfo;

@Controller
@RequestMapping("/class")
public class ControllerAboutClassInfo {
	
	@Autowired
	ServiceAboutClassInfo service;
	
	@GetMapping("/suggestion")
	public String classSuggestWindow() {
		return "/class/suggestion";
	}
	
	
	
	
	
	
	
	@PostMapping("/suggestion.do")
	public void insertSuggestion(SuggestDTO suggest) {
		System.out.println(suggest);
		service.insertSuggestion(suggest);
	}
	
	
	
}
