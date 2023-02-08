package com.penefit.moons.mapper;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.MemberVO;

@Mapper
public interface MapperAboutMember {
	
	//회원가입
	public int regMember(MemberVO member);
	
	//아이디 중복확인
	public int idCheck(@Param(value="id") String param1);
	
	//로그인
	public ArrayList<MemberVO> loginCheck(String id, String pw);
	
	
}
