package com.penefit.moons.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.QnAVO;
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


	@Override
	public int getClassTodayCount() {
		return mapper.getClassTodayCount();
	}


	@Override
	public int getClassEndCount() {
		return mapper.getClassEndCount();
	}


	@Override
	public int getClassActiveCount() {
		return mapper.getClassActiveCount();
	}


	@Override
	public List<ClassVO> getClassListToday() {
		return mapper.getClassListToday();
	}


	@Override
	public List<SuggestDTO> getSuggestList() {
		return mapper.getSuggestList();
	}


	@Override
	public int getSuggestCount() {
		return mapper.getSuggestCount();
	}


	@Override
	public int getQnACount() {
		return mapper.getQnACount();
	}


	@Override
	public List<QnAVO> getQnaList() {
		return mapper.getQnaList();
	}

}
