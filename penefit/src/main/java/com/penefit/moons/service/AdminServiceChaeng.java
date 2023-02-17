package com.penefit.moons.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.mapper.AdminMapperChaeng;

@Service
public class AdminServiceChaeng  implements AdimnServiceChaengIm{

	@Autowired
	AdminMapperChaeng mapper;
	
	
}
