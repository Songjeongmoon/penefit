package com.penefit.moons.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.ClassVO;

@Mapper
public interface ClassinfoMapper {

	//클래스목록조회
	public ArrayList<ClassVO> getClassList();
	
	//카테고리별 클래스 목록 조회
	public ArrayList<ClassVO> getCtgClassList(@Param(value = "key") String key);
	
	//신규클래스 조회
	public ArrayList<ClassVO> getNewClassList();
}
