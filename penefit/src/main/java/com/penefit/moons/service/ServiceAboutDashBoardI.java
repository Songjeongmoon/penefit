package com.penefit.moons.service;

import java.util.ArrayList;
import java.util.List;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.domain.VisitsDTO;

public interface ServiceAboutDashBoardI {
	
	//강사목록조희
	public ArrayList<MemberVO> teacherSelectALL();
	
	//오늘의 클래스목록조회
	public ArrayList<ClassVO> selectClassToday(String class_date);
	
	public int getClassTodayCount();
	
	public int getClassEndCount();
	
	public int getClassActiveCount();
	
	public List<ClassVO> getClassListToday();
	
	public List<SuggestDTO> getSuggestList();
	
	public int getSuggestCount();
	
	public int getQnACount();
	
	public List<QnAVO> getQnAList();
	
	public List<VisitsDTO> getVisits();
	
	public String  getGrade(String member_id);

	public int getMemberToday();
	
	public int getMember7days(int day);
	
	public int getMemall();
	
	public int getMemteacherall();
}
