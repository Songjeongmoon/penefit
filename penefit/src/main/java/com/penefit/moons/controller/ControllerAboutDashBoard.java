package com.penefit.moons.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.QnAVO;
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
		int classTodayCount = serviceDash.getClassTodayCount();
		int classEndCount = serviceDash.getClassEndCount();
		int classActiveCount = serviceDash.getClassActiveCount();
		List<ClassVO> dd = serviceDash.getClassListToday();
		List<SuggestDTO> ss  = serviceDash.getSuggestList();
		int suggestCunt = serviceDash.getSuggestCount();
		int qnaCount = serviceDash.getQnACount();
		List<QnAVO> qnalist = serviceDash.getQnAList();
		System.out.println("클래스리스트: "+clist);
		model.addAttribute("tlist", list);
		model.addAttribute("clist", clist);
		model.addAttribute("slist", ss);
		model.addAttribute("classTodayCount", classTodayCount);
		model.addAttribute("classEndCount", classEndCount);
		model.addAttribute("classActiveCount", classActiveCount);
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("qlist", qnalist);
		model.addAttribute("suggestCunt", suggestCunt);
	
		return "/dashboard/dashboard";
	}
	
	

}
