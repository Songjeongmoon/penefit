package com.penefit.moons.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.SuggestDTO;

@Mapper
public interface MapperAboutDashBoard {
	//강사목록조희
	public ArrayList<MemberVO> teacherSelectALL();
	
	//오늘의 클래스목록조회
	public ArrayList<ClassVO> selectClassToday(String class_date);
	
	//오늘의 클래스건수
	public int selectClassTodayCount(String class_date);
		
	
	//제안 목록 
	public ArrayList<SuggestDTO> SuggestionList();

}
