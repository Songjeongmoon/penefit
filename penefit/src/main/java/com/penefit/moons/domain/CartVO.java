package com.penefit.moons.domain;

import lombok.Data;

@Data
public class CartVO {
	private int shopping_cart_num;
	private String class_code, class_subject, suggest_photo, class_teacher, class_date;
	private int class_price, class_memlit, class_memcnt;
	private String member_id;
	
}
