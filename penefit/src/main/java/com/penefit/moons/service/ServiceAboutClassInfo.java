package com.penefit.moons.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.ClassListDTO;
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

	@Override
	public ArrayList<SuggestDTO> getMySuggestionList(String member_id) {
		ArrayList<SuggestDTO> list = mapper.getMySuggestionList(member_id);
		return list;
	}
	
	@Override
	public ArrayList<ClassListDTO> getMyClassList(String member_id){
		ArrayList<ClassListDTO> list = mapper.getMyClassList(member_id);
		
		return list;
	}
	
	
	
}
