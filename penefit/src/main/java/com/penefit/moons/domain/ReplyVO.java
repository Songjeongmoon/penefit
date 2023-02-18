package com.penefit.moons.domain;

import lombok.Data;

@Data
public class ReplyVO {
	private int board_num;
	private int reply_num;
	private String reply_content;
	private String reply_regdate;
	private String member_id;
	private String reply_type;
}
