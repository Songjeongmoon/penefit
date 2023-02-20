package com.penefit.moons.domain;

import lombok.Data;

@Data
public class ReviewVO {

	private String class_code;
	private String review_content;
	private String member_id;
	private String review_regdate;
	private String review_modidate;
	private Double score;
	
}
