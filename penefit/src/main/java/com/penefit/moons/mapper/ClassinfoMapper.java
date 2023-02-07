package com.penefit.moons.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.penefit.moons.domain.ClassVO;

@Mapper
public interface ClassinfoMapper {

	//클래스목록조회
	public ArrayList<ClassVO> getClassList();
}
