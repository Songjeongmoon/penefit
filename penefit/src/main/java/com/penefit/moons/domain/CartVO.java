package com.penefit.moons.domain;

import lombok.Data;

@Data
public class CartVO {
	private int shopping_cart_num;
	private String class_code, class_subject, class_photo, class_teacher, class_day, class_time;
	private int class_price;
	private String member_id;
	private String class_modidate;
	
}
