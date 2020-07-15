package com.spring.petsitter.board.mboard;

public class ReportReplyVO {
	/*
	 create table report_reply (
   bno number,
   rno number,
   report_reason varchar2(4000),
   member_id varchar2(30)
	);
	 */
	
	private int BNO;
	private int RNO;
	private String REPORT_REASON;
	private String MEMBER_ID;
	public int getBNO() {
		return BNO;
	}
	public void setBNO(int bNO) {
		BNO = bNO;
	}
	public int getRNO() {
		return RNO;
	}
	public void setRNO(int rNO) {
		RNO = rNO;
	}
	public String getREPORT_REASON() {
		return REPORT_REASON;
	}
	public void setREPORT_REASON(String rEPORT_REASON) {
		REPORT_REASON = rEPORT_REASON;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	

	
	
}
