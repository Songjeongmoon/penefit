
package com.penefit.moons.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.domain.VisitsDTO;

@Mapper
public interface MapperAboutDashBoard {
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
	
	public String getGrade(String member_id);

}

