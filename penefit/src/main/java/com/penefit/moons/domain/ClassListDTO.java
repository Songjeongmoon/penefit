package com.penefit.moons.domain;

import lombok.Data;

@Data
public class ClassListDTO {
	
	private String member_id;
	private String class_code;
	private String class_list_current;
	private String class_subject;
	private String class_teacher;
	private String class_date;
	private int class_memlit;
	private int class_memcnt;
	private int class_price;
	private String city_name;
	private String class_regdate;
	
	
}
