package com.penefit.moons.service;

import org.springframework.stereotype.Service;

import com.penefit.moons.domain.ClassVO;

@Service
public class ServiceAboutClassInfo implements ServiceAboutClassInfoIm{

	@Override
	public String classSuggestion(ClassVO classvo) {
		return "";
	}
	
}
