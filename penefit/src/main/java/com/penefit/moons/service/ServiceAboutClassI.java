package com.penefit.moons.service;

import java.util.ArrayList;

import com.penefit.moons.domain.ClassVO;

public interface ServiceAboutClassI {

	//전체 클래스 목록보기
	public ArrayList<ClassVO> getClassList();

	//카테고리별 클래스 목록
	ArrayList<ClassVO> getCtgClassList(String key);

	//신규 클래스 목록
	ArrayList<ClassVO> getNewClassList();

	//검색된 클래스 목록
	ArrayList<ClassVO> getSearchClassList(String keyword);
	
	//검색된 클래스 갯수
	int getSearchClassListCnt(String keyword);

	//클래스 상세보기
	ClassVO selectClassOne(String class_code);

}
