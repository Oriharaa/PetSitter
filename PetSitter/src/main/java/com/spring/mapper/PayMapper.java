package com.spring.mapper;

import com.spring.petsitter.pay.PayVO;

public interface PayMapper {
	public void insertPay(PayVO pay);
	public PayVO selectPay(String id);
	public void updatePay(String id);
}
