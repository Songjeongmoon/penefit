package com.penefit.moons.domain;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_num;
	private String class_code;
	private String class_subject;
	private String review_content;
	private String member_id;
	private String review_regdate;
	private String review_modidate;
	private Double score;
	private String review_photo;
	private int buy_history_num;
}
