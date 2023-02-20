

package com.penefit.moons.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.penefit.moons.domain.ClassListDTO;
import com.penefit.moons.domain.SuggestDTO;

public interface ServiceAboutClassInfoIm {
	
	public int insertSuggestion(SuggestDTO suggest, MultipartHttpServletRequest files);
	
	public ArrayList<SuggestDTO> getMySuggestionList(String member_id);

	public ArrayList<ClassListDTO> getMyClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListDayASC(String member_id);
	
	public ArrayList<ClassListDTO> getMyEndClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyActiveClassList(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListCnt(String member_id);
	
	public ArrayList<ClassListDTO> getMyClassListCntAsc(String member_id);
	
}