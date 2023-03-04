package com.penefit.moons.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.penefit.moons.domain.ClassListDTO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.SuggestDTO;

public interface ServiceAboutClassInfoIm {
	
	public int insertSuggestion(SuggestDTO suggest, MultipartHttpServletRequest files);

	public ArrayList<ClassListDTO> getMyClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListDayASC(String member_id);
	
	public ArrayList<ClassListDTO> getMyEndClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyActiveClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListCnt(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListCntAsc(String member_id);

	public ArrayList<SuggestDTO> getMySuggestionList(String member_id, int pageNum);
	
	public List<ClassVO> getMyClassListPage(int pageNum, String member_id);
	
	public List<MemberVO> getMyCustomerList(String class_code);
	
	public int getClassMaxPage(String member_id);
}