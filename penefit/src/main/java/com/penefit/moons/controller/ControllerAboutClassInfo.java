package com.penefit.moons.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.penefit.moons.domain.ClassListDTO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.service.ServiceAboutClassInfo;

@Controller
@RequestMapping("/class")
public class ControllerAboutClassInfo {
	
	@Autowired
	ServiceAboutClassInfo service;
	
	// 신청서 페이
	
	@GetMapping("/suggestion")
	public String classSuggestWindow() {
		return "/class/suggestion";
	}
	
	
	
	
	

	
	@PostMapping("/list/my/cnt")
	@ResponseBody
	public ArrayList<ClassListDTO> getMyClassListCnt(String member_id){
		ArrayList<ClassListDTO> list = service.getMyClassListCnt(member_id);
		
		return list;
	}
	
	@PostMapping("/list/my/cnt/asc")
	@ResponseBody
	public ArrayList<ClassListDTO> getMyClassListCntAsc(String member_id){
		ArrayList<ClassListDTO> list = service.getMyClassListCntAsc(member_id);
		
		return list;
	}
	
	
	
	@PostMapping("/list/my/end")
	@ResponseBody
	public ArrayList<ClassListDTO> getMyEndClassList(String member_id){
		ArrayList<ClassListDTO> list = service.getMyEndClassList(member_id);
		
		return list;
	}
	
	
	@PostMapping("/list/my/active")
	@ResponseBody
	public ArrayList<ClassListDTO> getMyActiveClassList(String member_id){
		
		ArrayList<ClassListDTO> list = service.getMyActiveClassList(member_id);
		
		return list;
	}
	
	
	
	@PostMapping("/list/my/day/asc")
	@ResponseBody
	public ArrayList<ClassListDTO> getMyClassListDay(String member_id){
		
		ArrayList<ClassListDTO> list = service.getMyClassListDayASC(member_id);
		
		return list;
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
	public String insertSuggestion(SuggestDTO suggest, MultipartHttpServletRequest files) {
		service.insertSuggestion(suggest, files);
		
		return "home";
	}
	
	//나의 신청서 리스트
	
	@PostMapping("/suggestion-list")
	@ResponseBody
	public ArrayList<SuggestDTO> getMySuggestionListASC(String member_id, Model model) {
		ArrayList<SuggestDTO> list = service.getMySuggestionList(member_id);
		model.addAttribute("list", list);
		return list;
	}
	
	
	
	
	
}
