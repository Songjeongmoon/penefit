package com.penefit.moons.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.service.QnaChaengI;
import com.penefit.moons.service.ServiceAboutMember;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board/*")
public class QnAChaeng {

	@Autowired
	QnaChaengI service;
	
	@Autowired
	ServiceAboutMember serviceMember;
	
	@PostMapping("/qnaForm")
	public String qnaForm(Model model, QnAVO qna, HttpSession session) {
		System.out.println("==========================");
		System.out.println("==========================");
		System.out.println("==========================");
		System.out.println("==========================");
		System.out.println("==========================");
		System.out.println(qna);
		String member_id = (String) session.getAttribute("member_id");
		service.regQna(qna);
		MemberVO member = serviceMember.selectOne(member_id);
		model.addAttribute("memberinfo",member);
		return "redirect:/member/infoMember";
	}
	
	@GetMapping("/QnA")
	public String QnA() {
		return "board/QnA";
	}
	
	
}
