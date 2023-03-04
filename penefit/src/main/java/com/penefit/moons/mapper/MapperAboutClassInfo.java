package com.penefit.moons.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.ClassListDTO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.SuggestDTO;

@Mapper
public interface MapperAboutClassInfo {
	
	public int insertSuggestion(SuggestDTO suggest);
	
	public ArrayList<SuggestDTO> getMySuggestionList(@Param("member_id") String member_id, @Param("pageNum") int pageNum);
	
	public ArrayList<ClassListDTO> getMyClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListDayASC(String member_id);
	
	public ArrayList<ClassListDTO> getMyEndClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyActiveClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListCnt(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListCntAsc(String member_id);
	
	public List<ClassVO> getMyClassListPage(@Param("startNum") int startNum, @Param("member_id")String member_id);
	
	public List<MemberVO> getMyCustomerList(String class_code);
	
	public int getClassMaxPage(String member_id);
	
}