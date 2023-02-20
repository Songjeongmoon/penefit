package com.penefit.moons.domain;

import lombok.Data;
@Data
public class HistoryVO {
	private int buy_history_num;
	private String imp_uid, merchant_uid, pay_method, bank_name, card_name;
	private int card_quota,amount;
	private String buy_history_date, member_id, name, buyer_name, buyer_email, buyer_tel, buyer_addr, buy_history_current, class_arr, classCode_arr;

}
