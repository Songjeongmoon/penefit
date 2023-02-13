package com.penefit.moons.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.penefit.moons.domain.SuggestDTO;

@Mapper
public interface MapperAboutClassInfo {
	
	public int insertSuggestion(SuggestDTO suggest);
	
}
