package com.penefit.moons.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.mapper.MapperAboutMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ServiceAboutMember implements ServiceAboutMemberI {

	@Autowired
	MapperAboutMember mapper;
	// mapper선언

	@Override
	public String regMember(MemberVO member) {
		int result = mapper.regMember(member);

		if (result == 1) {
			return "home";
		} else {
			return "home";
		}

	}

	@Override
	public int idCheck(String id) {
		int result = mapper.idCheck(id);
		return result;
	}

	@Override
	public String loginCheck(@ModelAttribute("member_id")String member_id, @ModelAttribute("member_pw")String member_pw, HttpSession Session) {
		ArrayList<MemberVO>list = mapper.loginCheck(member_id, member_pw);
		for(int i = 0 ; i<list.size();i++) {
			if(list.get(i).getMember_id().equals(member_id)&&list.get(i).getMember_pw().equals(member_pw)) {
				Session.setAttribute("member_id", member_id);
				
				return "home";
			}
			
		}
		return "/member/regMember";
		
	}

	@Override
	public String logout(HttpSession Session) {
		Session.invalidate();
		return "home";
	}
}
