package com.penefit.moons.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;

import com.penefit.moons.domain.MemberVO;


public interface ServiceAboutMemberI {
	
	//회원가입
	public String regMember(MemberVO member);
	//아이디체크
	public int idCheck(String id);
	//로그인
	public String loginCheck(@ModelAttribute("member_id")String member_id, @ModelAttribute("member_pw")String member_pw, HttpSession Session);
	//로그아웃
	public String logout(HttpSession session);
	//회원정보수정
	public String UpdateMember(MemberVO member);
	//회원정보조회
	public MemberVO selectOne(String id);
	//회원탈퇴
	public String DeleteMem(HttpSession session, String id);
}
