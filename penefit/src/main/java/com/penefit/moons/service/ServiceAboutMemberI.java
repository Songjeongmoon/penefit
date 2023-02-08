package com.penefit.moons.service;

import com.penefit.moons.domain.MemberVO;


public interface ServiceAboutMemberI {
	
	//회원가입
	public String regMember(MemberVO member);
	
	public int idCheck(String id);
}
