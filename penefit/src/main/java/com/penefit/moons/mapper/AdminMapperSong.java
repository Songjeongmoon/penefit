package com.penefit.moons.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.penefit.moons.domain.ClassListDTO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.SuggestDTO;

@Mapper
public interface AdminMapperSong {
	
	public int createClass(ClassVO vo);
	
	public int createClassList(ClassListDTO classListDTO);

	public SuggestDTO getSuggestInfo(String suggest_num);
	
	public String[] getTypeCnt();
	
	public int updateClass(ClassVO classvo);
	
	public int deleteClass(String class_code);
	
	public List<ClassVO> getClassList();
	
	public List<ClassVO> getClassListASC();
	
	public List<ClassVO> getClassListEnd();
	
	public List<ClassVO> getClassListActive();
	
	public List<ClassVO> searchClass(String class_subject);
	
	public List<SuggestDTO> getSuggestionList();

	public ClassVO getClassOne(String class_code);
	
}