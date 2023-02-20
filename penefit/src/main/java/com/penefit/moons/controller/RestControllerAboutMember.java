package com.penefit.moons.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.penefit.moons.service.ServiceAboutMember;

@RestController
@RequestMapping("/member")
public class RestControllerAboutMember {

	@Autowired
	ServiceAboutMember serviceMember;
	
	@GetMapping("idCheck")
	public int idCheck(String id) {
		System.out.println("id : " + id);
		int result = serviceMember.idCheck(id);
		return result;
	}
}
