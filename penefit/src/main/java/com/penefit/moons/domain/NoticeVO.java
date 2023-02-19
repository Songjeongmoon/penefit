package com.penefit.moons.domain;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int	notice_num;
	private String notice_title;
	private String notice_content;
	private String member_id;
	private String notice_regdate;
	private String notice_modidate;
	private String notice_photo;
	private int notice_viewcnt;

}
