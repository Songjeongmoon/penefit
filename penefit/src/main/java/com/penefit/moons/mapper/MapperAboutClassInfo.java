package com.penefit.moons.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.penefit.moons.domain.ClassListDTO;
import com.penefit.moons.domain.SuggestDTO;

@Mapper
public interface MapperAboutClassInfo {
	
	public int insertSuggestion(SuggestDTO suggest);
	
	public ArrayList<SuggestDTO> getMySuggestionList(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListDayASC(String member_id);
	
	public ArrayList<ClassListDTO> getMyEndClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyActiveClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListCnt(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListCntAsc(String member_id);
	
}