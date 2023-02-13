package com.penefit.moons.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.service.ServiceAboutMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class ControllerAboutMember {
	
	@Autowired
	ServiceAboutMember serviceMember;
	
	@GetMapping("regMember")
	public void regMemberGet() {
		log.info("get regMem...");
	}
	
	//회원가입
	@PostMapping("regMember")
	public String regMemberPost(MemberVO member) {
		String path = serviceMember.regMember(member);
		return path;
	}
	

	@GetMapping("login")
	public void login() {
		
	}
	
	@PostMapping("login.do")
	public String loginCheck(@ModelAttribute("member_id")String member_id, @ModelAttribute("member_pw")String member_pw,HttpSession Session) {
		serviceMember.loginCheck(member_id, member_pw,Session);
		log.info("===============================");
		log.info(serviceMember.loginCheck(member_id, member_pw,Session));
		return "redirect:/";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession Session) {
		serviceMember.logout(Session);
		System.out.println(Session);
		return "redirect:/";
	}
}
