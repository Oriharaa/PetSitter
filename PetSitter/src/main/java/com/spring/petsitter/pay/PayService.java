package com.spring.petsitter.pay;

public interface PayService {
	public void insertPay(PayVO pay);
	public PayVO selectPay(String id);
	public void updatePay(String id);
}
