package com.penefit.moons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MemberController {
	
	@GetMapping("/regMember")
	public String regMember() {
		return "regMember";
	}
	


}