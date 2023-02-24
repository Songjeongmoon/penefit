package com.penefit.moons.domain;

import lombok.Data;



@Data
public class ReplyVO {
	private int reply_num;
	private int board_num;
	private String reply_content;
	private String reply_regdate;
	private String member_id;
	private int qna_num;
	private String reply_type;
}
