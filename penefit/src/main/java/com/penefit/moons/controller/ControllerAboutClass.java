package com.penefit.moons.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.mapper.MapperAboutClass;

@Controller
public class ControllerAboutClass {
	@Autowired
	MapperAboutClass mapper;

	@GetMapping("/")
	public String root() {
		return "home";
	}

	// 전체클래스
	@GetMapping("/classList")
	public String getClassList(Model model) {
		ArrayList<ClassVO> list = mapper.getClassList();
		model.addAttribute("list", list);
		return "classList";
	}

	// 카테고리별 클래스 목록
	@GetMapping("categoryClassList")
	public String getCtgClassList(Model model, String key) {
		ArrayList<ClassVO> list = mapper.getCtgClassList(key);
		model.addAttribute("list", list);
		return "classList_category";
	}

	// 신규 클래스 목록
	@GetMapping("newClassList")
	public String getNewClassList(Model model) {
		ArrayList<ClassVO> list = mapper.getNewClassList();
		model.addAttribute("list", list);
		return "classList_new";
	}

	// 검색된 클래스 목록
	@GetMapping("searchClassList")
	public String getSearchClassList(Model model, String keyword) {
		ArrayList<ClassVO> list = mapper.getSearchClassList(keyword);
		model.addAttribute("list", list);
		int result = mapper.getSearchClassListCnt(keyword);
		model.addAttribute("result", result);
		model.addAttribute("keyword", keyword);
		return "classList_search";
	}

	// 클래스 상세보기
	@GetMapping("class_detail")
	public void selectClassOne(Model model, String class_code) {
		ClassVO cvo = mapper.selectClassOne(class_code);
		model.addAttribute("cvo", cvo);
	}
}
