package com.penefit.moons.domain;

import lombok.Data;

@Data
public class WishlistVO {

	private int wishlist_num;
	private String class_code;
	private String member_id;
	private String class_subject, class_photo, class_teacher, class_day, class_time;
	private int class_price;
	private String city_code;
	
}
