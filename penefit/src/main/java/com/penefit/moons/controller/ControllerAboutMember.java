package com.penefit.moons.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("/home")
	public String home() {
		return "/home";
		
	}
	
	@GetMapping("/MemberListGradeManager")
	public void MemberListGradeManager() {
		
	}
	
	
	@GetMapping("/MemberListManager")
	public void MemberListManager() {
		
	}


	
	@PostMapping("login.do")
	public String loginCheck(@ModelAttribute("member_id")String member_id, @ModelAttribute("member_pw")String member_pw,HttpSession Session,Model model) {
		String path=serviceMember.loginCheck(member_id, member_pw,Session);
		 model.addAttribute("msg","로그인 실패하였습니다!");
		log.info("===============================");
		log.info(serviceMember.loginCheck(member_id, member_pw,Session));
		return "redirect:"+path;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession Session) {
		serviceMember.logout(Session);
		System.out.println(Session);
		return "redirect:/";
	}
	@GetMapping("infoMember")
	public String goinfoMember(HttpSession Session, Model model) {
		String member_id = (String) Session.getAttribute("member_id");
		MemberVO member = serviceMember.selectOne(member_id);
		model.addAttribute("memberinfo",member);
		return "member/infoMember";
	}
	@PostMapping("/updateMember")
	@ResponseBody
	public String updateMember(@RequestBody MemberVO member) {
		String path=serviceMember.UpdateMember(member);
		return path;
	}
	@DeleteMapping("deleteMember")
	@ResponseBody
	public String deleteMember(String member_id, HttpSession Session) {
		System.out.println("memberid : " +member_id);
		Session.getAttribute("member_id");
		String path =serviceMember.DeleteMem(Session, member_id);
		return path;
	}
	@GetMapping("/selectall")
	public @ResponseBody ArrayList<MemberVO> seletALl() {
		ArrayList<MemberVO>list = serviceMember.selectAll(); 
		return list;
	}
	@GetMapping("/selectOneid")
	public @ResponseBody ArrayList<MemberVO> selectid(String id) {
		ArrayList<MemberVO>list = serviceMember.selectid(id);
		return  list;
	}
	@GetMapping("/selectOnename")
	public @ResponseBody ArrayList<MemberVO> selectOnename(String name) {
		ArrayList<MemberVO>list = serviceMember.seletname(name);
		return  list;
	}
	@GetMapping("/selectOnegrade")
	public @ResponseBody ArrayList<MemberVO> selectOnegrade(String grade) {
		ArrayList<MemberVO>list = serviceMember.selectgrade(grade);
		return  list;
	}
	@PutMapping("/gradeChange")
	@ResponseBody
	public String gradeChange(String id, String grade) {
		System.out.println("id , grade : "+id);
		System.out.println("id , grade : "+grade);
		String path = serviceMember.updateGrade(id, grade);
		return path;
	}
	@PostMapping("/UpdateMemManager")
	@ResponseBody
	public String UpdateMemManager(@RequestBody MemberVO member) {
		System.out.println("uptatemember :"+member);
		String path = serviceMember.updateMemberManager(member);
		return path;
	}
	@DeleteMapping("/deleteMemManager")
	@ResponseBody
	public String deleteMemManager(String id) {
		System.out.println("delid :"+id);
		String path = serviceMember.deleteMemberManager(id);
		return path;
	}
}
