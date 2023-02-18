package com.penefit.moons.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.SuggestDTO;

public interface AdminServiceSongIm {
	
	public String createClass(String suggest_num);
	
	public int updateClass(ClassVO classvo, MultipartHttpServletRequest files);
	
	public String deleteClass(String class_code);
	
	public List<ClassVO> getClassList();
	
	public List<ClassVO> searchClass(String class_subject);
	
	public List<SuggestDTO> getSuggestionList();
	
	public SuggestDTO getSuggestionInfo(String suggest_num);
	
	public ClassVO getClassOne(String class_code);
	
	public List<ClassVO> getClassListASC();
	
	public List<ClassVO> getClassListEnd();
	
	public List<ClassVO> getClassListActive();
 	
}
