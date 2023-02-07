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
	
	@GetMapping("classList")
	public String getClassList(Model model) {
		ArrayList<ClassVO> list = mapper.getClassList();
		model.addAttribute("list", list);
		return "classList";
	}
}
