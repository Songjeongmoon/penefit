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
	private String suggest_photo;
	private String class_time;
	private String time;
	private int maxCnt;
	private int price;
	private String type;
	private String status;
	private String reject_reason;
}
