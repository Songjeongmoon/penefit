package com.penefit.moons.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.SuggestDTO;

public interface ServiceAboutDashBoardI {
	
	//강사목록조희
	public ArrayList<MemberVO> teacherSelectALL();
	
	//오늘의 클래스목록조회
	public ArrayList<ClassVO> selectClassToday(String class_date);
	
	//제안 목록 
	public ArrayList<SuggestDTO> SuggestionList();

}
