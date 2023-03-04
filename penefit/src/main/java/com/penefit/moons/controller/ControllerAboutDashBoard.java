package com.penefit.moons.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.domain.VisitsDTO;
import com.penefit.moons.service.ServiceAboutDashBoard;

@Controller
@RequestMapping("/dashboard")
public class ControllerAboutDashBoard {
	
	@Autowired
	ServiceAboutDashBoard serviceDash;
	
	@GetMapping("/")
	public String dashboard(Model model, String class_date, HttpServletRequest req, HttpServletResponse res) {
		
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("member_id");
		String grade = serviceDash.getGrade(id);
		
		if(id == null || !grade.equals("C")) {
			
			res.setContentType("text/html; charset=UTF-8");
			try {
				PrintWriter out = res.getWriter();
				out.print("<script> alert('권한이 없습니다.'); history.back();</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}
		
		ArrayList<MemberVO>memberList = serviceDash.teacherSelectALL(); 
		
		int suggestionCount = serviceDash.getSuggestCount();
		List<SuggestDTO> suggestionList  = serviceDash.getSuggestList();
		
		int classTodayCount = serviceDash.getClassTodayCount();
		int classEndCount = serviceDash.getClassEndCount();
		int classActiveCount = serviceDash.getClassActiveCount();
		List<ClassVO> classTodayList = serviceDash.getClassListToday();
		int membertodayCount = serviceDash.getMemberToday();
		int member2dayCount = serviceDash.getMember7days(1);
		int member3dayCount = serviceDash.getMember7days(2);
		int member4dayCount = serviceDash.getMember7days(3);
		int member5dayCount = serviceDash.getMember7days(4);
		int member6dayCount = serviceDash.getMember7days(5);
		int member7dayCount = serviceDash.getMember7days(6);
	
		
		
		int qnaCount = serviceDash.getQnACount();
		List<QnAVO> qnaList = serviceDash.getQnAList();
		model.addAttribute("memberList", memberList);
		
		model.addAttribute("suggestionList", suggestionList);
		model.addAttribute("suggestionCount", suggestionCount);
		
		model.addAttribute("classTodayCount", classTodayCount);
		model.addAttribute("classEndCount", classEndCount);
		model.addAttribute("classActiveCount", classActiveCount);
		model.addAttribute("classTodayList", classTodayList);
		
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("membertodayCount", membertodayCount);
		model.addAttribute("member2dayCount", member2dayCount);
		model.addAttribute("member3dayCount", member3dayCount);
		model.addAttribute("member4dayCount", member4dayCount);
		model.addAttribute("member5dayCount", member5dayCount);
		model.addAttribute("member6dayCount", member6dayCount);
		model.addAttribute("member7dayCount", member7dayCount);
		
		List<VisitsDTO> visits = serviceDash.getVisits();
		List<VisitsDTO> visitList = new ArrayList<>();
		for(int i = visits.size() - 1; i >= 0; i--) {
			VisitsDTO dto = new VisitsDTO();
			dto.setVisit(visits.get(i).getVisit());
			dto.setDay(visits.get(i).getDay());
			visitList.add(dto);
		}
		model.addAttribute("visits", visitList);
		return "/admin/dashboard";
	}
	
	

}
