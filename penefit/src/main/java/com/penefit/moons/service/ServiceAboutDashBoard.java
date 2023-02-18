package com.penefit.moons.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.mapper.MapperAboutDashBoard;

@Service
public class ServiceAboutDashBoard implements ServiceAboutDashBoardI{
	
	@Autowired
	MapperAboutDashBoard mapper;
	

	@Override
	public ArrayList<MemberVO> teacherSelectALL() {
		ArrayList<MemberVO>list = mapper.teacherSelectALL();
		return list;
	}


	@Override
	public ArrayList<ClassVO> selectClassToday(String class_date) {
		ArrayList<ClassVO>list = mapper.selectClassToday(class_date);
		return list;
	}


	@Override
	public ArrayList<SuggestDTO> SuggestionList() {
		ArrayList<SuggestDTO>list = mapper.SuggestionList();
		return list;
	}

}
