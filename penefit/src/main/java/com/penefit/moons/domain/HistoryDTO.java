package com.penefit.moons.domain;

import java.util.List;

import lombok.Data;
@Data
public class HistoryDTO {
	private List<Integer> class_arr;
	private List<String> classCode_arr;
	private int amount;
	private String imp_uid, merchant_uid, pay_method, pg_provider, pg_tid, bank_name, card_name;
	private int card_quota;
	private String card_number, name, currency, buyer_name, buyer_email, buyer_tel, buyer_addr;

}
