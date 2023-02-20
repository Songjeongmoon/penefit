package com.penefit.moons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "class/suggestion/adminSuggestionList";
	}
	
	@GetMapping("suggestion/list")
	@ResponseBody
	public List<SuggestDTO> getSuggestionList(){
		return service.getSuggestionList();
	}
	
	
	@GetMapping("/class")
	public String getClassList(Model model){
		
		List<ClassVO> list = service.getClassList();
		model.addAttribute("list", list);
		return "/admin-class-list";
	}
	
	@GetMapping("/class/DESC")
	@ResponseBody
	public List<ClassVO> getClassListDESC(){
		return service.getClassList();
	}
	
	@GetMapping("/class/ASC")
	@ResponseBody
	public List<ClassVO> getClassListASC(){
		return service.getClassListASC();
	}
	
	@GetMapping("/class/end")
	@ResponseBody
	public List<ClassVO> getClassListEnd(){
		return service.getClassListEnd();
	}
	
	@GetMapping("/class/active")
	@ResponseBody
	public List<ClassVO> getClassListActive(){
		return service.getClassListActive();
	}
	
	@GetMapping("/class/one")
	@ResponseBody
	public ClassVO getClassOne(String class_code) {
		return service.getClassOne(class_code);
	}
	
	@PostMapping("/class")
	@ResponseBody
	public SuggestDTO regClass(String suggest_num) {
		
		SuggestDTO suggest = service.createClass(suggest_num);
		
		return suggest;
		
	}
	
	@PutMapping("/class")
	@ResponseBody
	public String updateClass(ClassVO classvo, MultipartHttpServletRequest files) {
		String result = service.updateClass(classvo, files);
		
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
	
	
	
	
	
}
