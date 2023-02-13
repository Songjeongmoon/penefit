package com.penefit.moons.domain;

import lombok.Data;

@Data
public class ClassVO {

	private String class_code, class_subject, suggest_photo, class_teacher, class_date, class_info;
	private int class_memlit, class_memcnt, class_price;
	private String city_code;
	private int suggest_num;
	private String class_regdate;
}
