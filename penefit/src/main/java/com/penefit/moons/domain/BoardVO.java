package com.penefit.moons.domain;

import lombok.Data;


@Data
public class BoardVO {
	private int	board_num;
	private String board_title;
	private String board_content;
	private String member_id;
	private String board_regdate;
	private String board_modidate;
	private String board_photo;
	private int board_viewcnt;
	private String city_code;
	private String city_name;
	private String board_type;
	private String page_num;
	private String content_num;
}
