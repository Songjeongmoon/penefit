package com.penefit.moons.controller;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.service.ServiceAboutDashBoard;

@Controller
@RequestMapping("/dashboard")
public class ControllerAboutDashBoard {
	
	@Autowired
	ServiceAboutDashBoard serviceDash;
	
	@GetMapping("/")
	public String dashboard(Model model, String class_date) {
		LocalDate now = LocalDate.now();
		System.out.println(now.toString());
		ArrayList<MemberVO>list = serviceDash.teacherSelectALL(); 
		ArrayList<ClassVO>clist = serviceDash.selectClassToday(now.toString());
		ArrayList<SuggestDTO>slist=serviceDash.SuggestionList();
		System.out.println("클래스리스트: "+clist);
		model.addAttribute("tlist", list);
		model.addAttribute("clist", clist);
		model.addAttribute("slist", slist);
		
		return "/dashboard/dashboard";
	}
	
	

}
