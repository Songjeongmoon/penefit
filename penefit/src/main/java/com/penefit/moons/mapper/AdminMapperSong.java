package com.penefit.moons.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.ClassListDTO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.SuggestDTO;

@Mapper
public interface AdminMapperSong {
	
	public int createClass(ClassVO vo);
	
	public int createClassList(ClassListDTO classListDTO);

	public SuggestDTO getSuggestInfo(int suggest_num);
	
	public String[] getTypeCnt();
	
	public int updateClass(ClassVO classvo);
	
	public int deleteClass(String class_code);
	
	public List<ClassVO> getClassList(@Param("keyword") String keyword, @Param("startNum")int startNum);
	
	public List<ClassVO> getClassListASC(@Param("keyword") String keyword, @Param("startNum")int startNum);
	
	public List<ClassVO> getClassListEnd(@Param("keyword") String keyword, @Param("startNum")int startNum);
	
	public List<ClassVO> getClassListActive(@Param("keyword") String keyword, @Param("startNum")int startNum);
	
	public List<ClassVO> searchClass(String class_subject);
	
	public List<SuggestDTO> getSuggestionList();

	public ClassVO getClassOne(String class_code);
	
	public int rejectSuggestion(@Param("suggest_num") int suggest_num, @Param("reject_reason") String reject_reason);

	public List<ClassVO> classListSearch(String keyword);

	public void approveSuggestion(int suggest_num);
	
	public void upgradeUpgrade(String member_id);
	
}