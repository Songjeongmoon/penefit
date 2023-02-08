package com.penefit.moons.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.mapper.MapperAboutClassInfo;

@Service
public class ServiceAboutClassInfo implements ServiceAboutClassInfoIm{
	
	@Autowired
	MapperAboutClassInfo mapper;
	
	@Override
	public String insertSuggestion(SuggestDTO suggest) {
		
		int result = mapper.insertSuggestion(suggest);
		return "";
	}
	
}
