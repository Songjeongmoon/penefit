package com.penefit.moons.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.SuggestDTO;

@Mapper
public interface AdminMapperSong {
	
	public int createClass(ClassVO vo);
	
	public SuggestDTO getSuggestInfo(String suggest_num);
	
	public String[] getTypeCnt();
	
}
