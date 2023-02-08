package com.penefit.moons.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.mapper.MapperAboutAdmin;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ServiceAboutAdmin implements ServiceAboutAdminI {
	
	@Autowired
	MapperAboutAdmin admapper;

	@Override
	public int noticeReg(BoardVO bvo) {
		int result = admapper.noticeReg(bvo);
	return result;
	}
	
	
	
	

}
