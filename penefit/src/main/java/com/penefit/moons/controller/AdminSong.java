package com.penefit.moons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.service.AdminServiceSong;

@Controller
@RequestMapping("/admin")
class AdminSong {
	
	@Autowired
	AdminServiceSong service;
	
	@GetMapping("class/registration")
	public String createClass() {
		return "registration";
	}
	
	@GetMapping("/suggestionlist")
	public String SuggestionListWindow() {
		return "admin/adminSuggestList";
	}
	
	@GetMapping("suggestion/list")
	@ResponseBody
	public List<SuggestDTO> getSuggestionList(){
		return service.getSuggestionList();
	}
	
	
//	@GetMapping("/class")
//	public String getClassList(Model model){
//		
//		List<ClassVO> list = service.getClassList();
//		System.out.println(list);
//		model.addAttribute("list", list);
//		return "/admin-class-list";
//	}
	
	@GetMapping("/class/one")
	@ResponseBody
	public ClassVO getClassOne(String class_code) {
		return service.getClassOne(class_code);
	}
	
	@PostMapping("/class")
	@ResponseBody
	public int regClass(int suggest_num) {
		int result = service.createClass(suggest_num);
		
		return result;
		
	}
	
	@PutMapping("/class/update")
	@ResponseBody
	public String updateClass(ClassVO classvo, MultipartHttpServletRequest files) {
		String result = service.updateClass(classvo, files);
		return result;
	}
	
	@PutMapping("/suggestion")
	@ResponseBody
	public int rejectSuggestion(int suggest_num, String reject_reason) {
	    int result = service.rejectSuggestion(suggest_num, reject_reason);
		
		return result;
	}
	
	
	@DeleteMapping("/class")
	@ResponseBody
	public String deleteClass(String class_code) {
		String result = service.deleteClass(class_code);
		
		return result;
	}
	
	@GetMapping("/class/index")
	@ResponseBody
	public List<ClassVO> searchClass(String class_subject){
		List<ClassVO> list = service.searchClass(class_subject);
		
		return list;
	}
	
	@GetMapping("/suggestion/one")
	@ResponseBody
	public SuggestDTO getSuggestionOne(int suggest_num) {
		
		return service.getSuggestionInfo(suggest_num);
	}
	
	
	
	
	
}
