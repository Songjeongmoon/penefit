package com.penefit.moons.service;

import java.util.ArrayList;

import com.penefit.moons.domain.ClassListDTO;
import com.penefit.moons.domain.SuggestDTO;

public interface ServiceAboutClassInfoIm {
	
	public String insertSuggestion(SuggestDTO suggest);
	
	public ArrayList<SuggestDTO> getMySuggestionList(String member_id);

	public ArrayList<ClassListDTO> getMyClassList(String member_id);
	
}
