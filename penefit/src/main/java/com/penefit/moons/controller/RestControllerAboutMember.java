package com.penefit.moons.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.service.ServiceAboutMember;

@RestController
@RequestMapping("/member")
public class RestControllerAboutMember {

	@Autowired
	ServiceAboutMember serviceMember;
	
	@GetMapping("idCheck")
	public int idCheck(String id) {
		int result = serviceMember.idCheck(id);
		return result;
	}
	
	@GetMapping("/MembermanagerList")
	public List<MemberVO> reviewList(int pageNum){
		int pageNumF = pageNum * 5-5;
		List<MemberVO> list = serviceMember.getMemManagerList(pageNumF);
		return list;
	}
	
	@GetMapping("/MembermanagermaxPage")
	public int qnamaxPage() {
		int result = serviceMember.getMemManagerListmaxPage();
		return result;
	}
}
