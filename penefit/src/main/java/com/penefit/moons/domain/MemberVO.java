package com.penefit.moons.domain;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class MemberVO {
	
	@NotBlank
	private String member_id;
	
	@NotBlank
	private String member_pw;
	
	@NotBlank
	private String member_name;
	
	@NotBlank
	private String member_tel;
	
	@NotBlank
	private String member_address;
	
	@NotBlank
	private String member_addressdetail;
	
	@NotBlank
	private String postnum;
	
	@NotBlank
	private String member_grade;
	
	private int score;	 

}
