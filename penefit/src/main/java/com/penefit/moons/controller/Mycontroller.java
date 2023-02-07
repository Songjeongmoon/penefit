package com.penefit.moons.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.mapper.ClassinfoMapper;

@Controller
public class Mycontroller {
	@Autowired
	ClassinfoMapper mapper;

	@GetMapping("/")
	public String root() {
		return "home";
	}

	// 전체클래스
	@GetMapping("classList")
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
}
