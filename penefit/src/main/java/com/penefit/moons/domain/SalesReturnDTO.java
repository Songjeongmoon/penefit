package com.penefit.moons.domain;

import lombok.Data;

@Data
public class SalesReturnDTO {

	private String buy_history_date;
	private int cancelled_amount, completed_amount;
}
