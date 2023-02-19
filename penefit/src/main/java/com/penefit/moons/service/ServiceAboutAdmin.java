package com.penefit.moons.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.mapper.MapperAboutAdmin;

@Service

public class ServiceAboutAdmin implements ServiceAboutAdminI {
	
	@Autowired
	MapperAboutAdmin admapper;

	@Override
	public int noticeReg(NoticeVO nvo) {
		int result = admapper.noticeReg(nvo);
	return result;
	}
	
	
	
	

}
