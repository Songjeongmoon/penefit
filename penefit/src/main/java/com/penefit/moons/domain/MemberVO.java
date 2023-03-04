package com.penefit.moons.domain;



import lombok.Data;

@Data
public class MemberVO {
	
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_tel;
	private String member_address;
	private String member_addressdetail;
	private String postnum;
	private String member_grade;
	private int score;	 

}
