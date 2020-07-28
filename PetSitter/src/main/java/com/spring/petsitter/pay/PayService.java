package com.spring.petsitter.pay;

public interface PayService {
	public void insertPay(PayVO pay);
	public PayVO selectPay(String id);
	public void updatePay(String id);
	public void memberAmount(int amount, String m_id);
	public void memberAmountRemove(int amount, String m_id);
	public void petsitterAmount(int amount, String p_id);
	public void petsitterAmountRemove(int amount, String p_id);
}
