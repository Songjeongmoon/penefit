package com.penefit.moons.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.penefit.moons.domain.BoardVO;

@Mapper
public interface MapperAboutAdmin {
	
	public int noticeReg(BoardVO bvo);		//공지사항등록
	
	

}
