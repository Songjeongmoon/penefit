package com.penefit.moons.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.mapper.MapperAboutClass;

@Service
public class ServiceAboutClass implements ServiceAboutClassI{
	
	@Autowired
	MapperAboutClass mapper;

	@Override
	public ArrayList<ClassVO> getClassList() {
		ArrayList<ClassVO> list = mapper.getClassList();
		return list;
		
	}

	@Override
	public ArrayList<ClassVO> getCtgClassList(String key) {
		ArrayList<ClassVO> list = mapper.getCtgClassList(key);
		return list;
	}

	@Override
	public ArrayList<ClassVO> getNewClassList() {
		ArrayList<ClassVO> list = mapper.getNewClassList();
		return list;
	}

	@Override
	public ArrayList<ClassVO> getSearchClassList(String keyword) {
		ArrayList<ClassVO> list = mapper.getSearchClassList(keyword);
		return list;
	}

	@Override
	public int getSearchClassListCnt(String keyword) {
		int result = mapper.getSearchClassListCnt(keyword);
		return result;
	}

	@Override
	public ClassVO selectClassOne(String class_code) {
		ClassVO cvo = mapper.selectClassOne(class_code);
		return cvo;
	}
	@Override
	public int checkWishlist(String class_code, String member_id) {
		int result = mapper.checkWishlist(class_code, member_id);
		return result;
	}
	
}
