package com.spring.petsitter.pay;

import java.util.List;

public interface PayService {
	public void insertPay(PayVO pay);
	public PayVO selectPay(String id);
	public void updatePay(String id);
	public List<PayVO> getPayList(PayVO pay);
}