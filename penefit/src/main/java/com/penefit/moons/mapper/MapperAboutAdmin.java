package com.penefit.moons.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.penefit.moons.domain.NoticeVO;

@Mapper
public interface MapperAboutAdmin {
	
	public int noticeReg(NoticeVO nvo);		//공지사항등록
	
	

}
