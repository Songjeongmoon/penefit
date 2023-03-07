package com.penefit.moons.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.ReviewVO;

@Mapper
public interface MapperAboutMember {
	
	//회원가입
	public int regMember(MemberVO member);
	
	//아이디 중복확인
	public int idCheck(@Param(value="id") String param1);
	
	//로그인
	public ArrayList<MemberVO> loginCheck();
	//회원정보수정
	public int updateMember(MemberVO member);
	//회원정보조회
	public MemberVO selectOne(String id);
	//회원탈퇴
	public int deleteMember(String id);
	
	//관리자 회원목록
	public ArrayList<MemberVO> selectALL();
	//관리자 회원 찾기(아이디)
	public ArrayList<MemberVO> selectOneID(String id);
	//관리자 회원 찾기(이름)
	public ArrayList<MemberVO> selectOneName(String name);
	//관리자 회원 찾기(등급)
	public ArrayList<MemberVO> selectOneGrade(String grade);
	//관리자 등급변경
	public int updateGrade(@Param(value="member_id") String id, @Param(value="member_grade") String grade);
	//관리자 회원정보수정
	public int updateMemberManager(MemberVO member);
	//관리자 회원탈퇴
	public int deleteMemberManager(String id);
	
	//관리자 멤버리스트 페이지
	public ArrayList<MemberVO> getMemManagerList(@Param("keyword") String keyword, @Param("startNum") int startNum);
	//관리자 멤버리스트 아이디검색
	public ArrayList<MemberVO> getMemManagerListId(@Param("keyword") String keyword, @Param("startNum") int startNum);
	//관리자 멤버리스트 이름검색
	public ArrayList<MemberVO> getMemManagerListName(@Param("keyword") String keyword, @Param("startNum") int startNum);
	//관리자 멤버리스트 등급검색
	public ArrayList<MemberVO> getMemManagerListGrade(@Param("keyword") String keyword, @Param("startNum") int startNum);
	
	//관리자 멤버리스트 페이지수
	public int getMemberMaxPage(String keyword);
	
	public int getMemberMaxPageId(String keyword);
	
	public int getMemberMaxPageName(String keyword);
	
	public int getMemberMaxPageGrade(String keyword);
	
	//관리자 강사리스트 페이지
	public ArrayList<MemberVO> getManagerManagerList(@Param("keyword") String keyword, @Param("startNum") int startNum);
	//관리자 강사리스트 아이디검색
	public ArrayList<MemberVO> getManagerManagerListId(@Param("keyword") String keyword, @Param("startNum") int startNum);
	//관리자 강사리스트 이름검색
	public ArrayList<MemberVO> getManagerManagerListName(@Param("keyword") String keyword, @Param("startNum") int startNum);
	//관리자 강사리스트 등급검색
	public ArrayList<MemberVO> getManagerManagerListGrade(@Param("keyword") String keyword, @Param("startNum") int startNum);
	
	//관리자 멤버리스트 페이지수
	public int getManagerMaxPage(String keyword);
	
	public int getManagerMaxPageId(String keyword);
	
	public int getManagerMaxPageName(String keyword);
	
	public int getManagerMaxPageGrade(String keyword);
	
	public int getMemall();
	
	public int getMemteacherall();
}
