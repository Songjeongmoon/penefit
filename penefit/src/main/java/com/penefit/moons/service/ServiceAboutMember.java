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
		System.out.println("service의 id : " + id);
		int result = mapper.idCheck(id);
		System.out.println("--------------------------" + result);
		log.info("===============================================");
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

	@Override
	public String UpdateMember(MemberVO member) {
		int result = mapper.updateMember(member);
		String path = "";
		if(result==1) {
			path = "수정완료";
		}else {
			path = "수정실패";
		}
		return path;
	}

	@Override
	public MemberVO selectOne(String id) {
		MemberVO member = mapper.selectAll(id);
		return member;
	}

	@Override
	public String DeleteMem(HttpSession session, String id) {
		mapper.deleteMember(id);
		session.invalidate();
		
		return "home";
	}
}
