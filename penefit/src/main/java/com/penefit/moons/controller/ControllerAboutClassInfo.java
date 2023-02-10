package com.penefit.moons.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.penefit.moons.domain.ClassListDTO;
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
	
	
	
	
	
	
	
	//나의 클래스 리스트 전체조회
	
	@PostMapping("/list/my")
	@ResponseBody
	public  ArrayList<ClassListDTO> getMyClassList(Model model, String member_id){
		ArrayList<ClassListDTO> list = service.getMyClassList(member_id);
		model.addAttribute("list", list);
		
		return list;
	}
	
	
	//클래스 신청서 접수
	
	@PostMapping("/suggestion")
	public String insertSuggestion(SuggestDTO suggest) {
		System.out.println(suggest);
		service.insertSuggestion(suggest);
		return "home";
	}
	
	//나의 신청서 리스트
	
	@PostMapping("/suggestion-list")
	@ResponseBody
	public ArrayList<SuggestDTO> getMySuggestionList(String member_id, Model model) {
		ArrayList<SuggestDTO> list = service.getMySuggestionList(member_id);
		model.addAttribute("list", list);
		return list;
	}
	
	
	
	
	
}
