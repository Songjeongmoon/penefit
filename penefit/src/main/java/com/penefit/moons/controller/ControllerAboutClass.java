package com.penefit.moons.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.service.ServiceAboutClass;

@Controller
@RequestMapping("/class")
public class ControllerAboutClass {
	@Autowired
	ServiceAboutClass service;
	//서비스(인터)

	// 전체클래스
	@GetMapping("classList")
	public void getClassList(Model model) {
		ArrayList<ClassVO> list = service.getClassList();
		model.addAttribute("list", list);
	}

	// 카테고리별 클래스 목록
	@GetMapping("classList_category")
	public void getCtgClassList(Model model, String key) {
		ArrayList<ClassVO> list = service.getCtgClassList(key);
		model.addAttribute("list", list);
	}

	// 신규 클래스 목록
	@GetMapping("classList_new")
	public void getNewClassList(Model model) {
		ArrayList<ClassVO> list = service.getNewClassList();
		model.addAttribute("list", list);
	}

	// 검색된 클래스 목록
	@GetMapping("classList_search")
	public void getSearchClassList(Model model, String keyword) {
		ArrayList<ClassVO> list = service.getSearchClassList(keyword);
		model.addAttribute("list", list);
		int result = service.getSearchClassListCnt(keyword);
		model.addAttribute("result", result);
		model.addAttribute("keyword", keyword);
	}

	// 클래스 상세보기
	@GetMapping("class_detail")
	public void selectClassOne(Model model, String class_code) {
		ClassVO cvo = service.selectClassOne(class_code);
		model.addAttribute("cvo", cvo);
	}
}
