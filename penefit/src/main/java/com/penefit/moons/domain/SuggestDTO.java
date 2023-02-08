package com.penefit.moons.domain;

import lombok.Data;

@Data
public class SuggestDTO {
	
	private int suggest_num;
	private String member_id;
	private String suggest_title;
	private String suggest_content;
	private String suggest_regdate;
	private String city_code;
}
