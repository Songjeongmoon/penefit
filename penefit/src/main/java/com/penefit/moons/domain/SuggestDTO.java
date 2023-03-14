package com.penefit.moons.domain;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;

import lombok.Data;

@Data
public class SuggestDTO {
	
	private int suggest_num;
	@NotBlank
	private String member_id;
	@NotBlank
	private String suggest_title;
	@NotBlank
	private String suggest_content;
	private String suggest_regdate;
	@NotBlank
	private String city_code;
	private String suggest_photo;
	@NotBlank
	private String class_time;
	@NotBlank
	private String time;
	@NotNull
	@Min(1)
	@Positive
	private int maxCnt;
	@NotNull
	@Positive
	private int price;
	@NotBlank
	private String type;
	private String status;
	private String reject_reason;
}
