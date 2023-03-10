package com.penefit.moons.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.service.ServiceAboutClass;
import com.penefit.moons.service.ServiceAboutMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class ControllerAboutMember {

	@Autowired
	ServiceAboutMember serviceMember;

	@Autowired
	ServiceAboutClass cservice;

	@GetMapping("regMember")
	public void regMemberGet() {
		log.info("get regMem...");
	}

	// 회원가입
	@PostMapping("regMember")
	public String regMemberPost(MemberVO member) {
		String path = serviceMember.regMember(member);
		return path;
	}

	@GetMapping("login")
	public void login() {

	}

	@GetMapping("/regComplete")
	public void regComplete() {

	}

	@GetMapping("/home")
	public String home() {
		return "redirect:/";

	}

	@GetMapping("/MemberListGradeManager")
	public void MemberListGradeManager() {

	}

	@GetMapping("/MemberListManager")
	public void MemberListManager() {

	}

	@PostMapping("login.do")
	public void loginCheck(HttpServletResponse res, String member_id, String member_pw,HttpSession Session,Model model) {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		int result = -1;
		try {
			out = res.getWriter();
			
			if(member_id.equals("") || member_pw.equals("")) {
				out.print("<script> alert('입력값 확인해주세요.'); location.href= '/member/login';</script>");
				out.close();
			} else {
				result=serviceMember.loginCheck(member_id, member_pw,Session);
				if(result == 1) {
					out.print("<script> location.href= '/';</script>");
				} else if(result == 2) {
					out.print("<script> location.href= '/dashboard/';</script>");
				} else { 
					out.print("<script> alert('일치하는 정보가 없습니다.'); location.href= '/member/login';</script>");
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession Session) {
		serviceMember.logout(Session);
		return "redirect:/";
	}

	@GetMapping("/infoMember")
	public String goinfoMember(HttpSession Session, Model model) {
		String member_id = (String) Session.getAttribute("member_id");
		if(member_id == null) {
			return "redirect:/";
		}
		MemberVO member = serviceMember.selectOne(member_id);
		model.addAttribute("memberinfo", member);
		return "/member/infoMember";
	}


	@PutMapping("/updateMember")
	@ResponseBody
	public String updateMember(@RequestBody MemberVO member, HttpServletResponse res) {
		res.setContentType("text/html; charset=UTF-8");
		int result = serviceMember.UpdateMember(member);

		if(result == 1) {
			return "수정 완료";
		} else {
			return "수정 실패";
		}
	}
	
	@DeleteMapping("deleteMember")
	@ResponseBody
	public String deleteMember(String member_id, HttpSession Session) {
		Session.getAttribute("member_id");
		String path = serviceMember.DeleteMem(Session, member_id);
		return path;
	}

	@GetMapping("/selectall")
	public @ResponseBody ArrayList<MemberVO> seletALl() {
		ArrayList<MemberVO> list = serviceMember.selectAll();
		return list;
	}

	@GetMapping("/selectOneid")
	public @ResponseBody ArrayList<MemberVO> selectid(String id) {
		ArrayList<MemberVO> list = serviceMember.selectid(id);
		return list;
	}

	@GetMapping("/selectOnename")
	public @ResponseBody ArrayList<MemberVO> selectOnename(String name) {
		ArrayList<MemberVO> list = serviceMember.seletname(name);
		return list;
	}

	@GetMapping("/selectOnegrade")
	public @ResponseBody ArrayList<MemberVO> selectOnegrade(String grade) {
		ArrayList<MemberVO> list = serviceMember.selectgrade(grade);
		return list;
	}

	@PutMapping("/gradeChange")
	@ResponseBody
	public String gradeChange(String id, String grade) {
		System.out.println(id);
		System.out.println(grade);
		String path = serviceMember.updateGrade(id, grade);
		return path;
	}

	@PostMapping("/UpdateMemManager")
	@ResponseBody
	public String UpdateMemManager(@RequestBody MemberVO member) {
		String path = serviceMember.updateMemberManager(member);
		return path;
	}

	@DeleteMapping("/deleteMemManager")
	@ResponseBody
	public String deleteMemManager(String id) {
		String path = serviceMember.deleteMemberManager(id);
		return path;
	}

	// 구매내역 페이지수
	@GetMapping("/historymaxPage")
	@ResponseBody
	public int historymaxPage(HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		int result = cservice.historymaxPage(member_id);
		return result;
	}

	
	

}
