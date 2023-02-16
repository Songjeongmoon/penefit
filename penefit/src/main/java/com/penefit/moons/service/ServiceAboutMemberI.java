package com.penefit.moons.service;

import java.util.ArrayList;

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
	
	//관리자 회원목록
	public ArrayList<MemberVO> selectAll();
	//관리자 회원 찾기(아이디)
	public ArrayList<MemberVO> selectid(String id);
	//관리자 회원 찾기(이름)
	public ArrayList<MemberVO> seletname(String name);
	//관리자 회원 찾기(등급)
	public ArrayList<MemberVO> selectgrade(String grade);
	//관리자 등급변경
	public String updateGrade(String id, String grade);
	//관리자 회원정보수정
	public String updateMemberManager(MemberVO member);
	//관리자 회원탈퇴
	public String deleteMemberManager(String id);
		
}
