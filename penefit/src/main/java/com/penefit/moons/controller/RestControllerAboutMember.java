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
	public List<MemberVO> getMemManagerList(String status, String keyword, int startNum){
		startNum = (startNum - 1) * 5;
		List<MemberVO> list = serviceMember.getMemManagerList(status, keyword, startNum);
		return list;
	}
	
	@GetMapping("/member-max-all")
	public int getMemberMaxPage(String status, String keyword){
		int result = serviceMember.getMemberMaxPage(status, keyword);
		if(result % 5 == 0) {
			return result / 5;
		} else {
			return result / 5 + 1;
		}
	}
	
	@GetMapping("/managermanagerList")
	public List<MemberVO> getManagerManagerList(String status, String keyword, int startNum){
		startNum = (startNum - 1) * 10;
		List<MemberVO> list = serviceMember.getManagerManagerList(status, keyword, startNum);
		return list;
	}
	
	@GetMapping("/manager-max-all")
	public int getManagerMaxPage(String status, String keyword){
		int result = serviceMember.getManagerMaxPage(status, keyword);
		if(result % 5 == 0) {
			return result / 10;
		} else {
			return result / 10 + 1;
		}
	}
}
