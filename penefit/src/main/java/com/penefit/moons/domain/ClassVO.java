package com.penefit.moons.domain;

import lombok.Data;

@Data
public class ClassVO {

	private String class_code, class_subject, class_photo, class_teacher, class_day, class_time, class_info;
	private int class_memlit, class_memcnt, class_price;
	private String city_code;
	private String class_regdate;
}
