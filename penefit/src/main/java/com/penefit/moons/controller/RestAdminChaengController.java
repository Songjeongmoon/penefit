package com.penefit.moons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.service.AdminServiceChaeng;

@RestController
@RequestMapping("/admin")
public class RestAdminChaengController {

	@Autowired
	AdminServiceChaeng service;
	
	@GetMapping("/getAdminQnaWithFilter")
	public List<QnAVO>  getAdminQnaWithFilter(Model model,String filterKey) {
		List<QnAVO> list = service.getAdminQnaWithFilter(filterKey);
		return list;
	}
}
