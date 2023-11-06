package model_p;

public class adminData {
	
	//주문갯수, 주문가격, 상품문의, 환불, 취소
	int orderCnt, totPrice, priqq, refundqq, cancelqq;
	
	//배송준비중, 배송중, 배송완료
	int prpDlv,drnDlv,cmpDlv;
	
	String today,nextday;

	public int getOrderCnt() {
		return orderCnt;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public String getNextday() {
		return nextday;
	}

	public void setNextday(String nextday) {
		this.nextday = nextday;
	}

	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}

	public int getTotPrice() {
		return totPrice;
	}

	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}

	public int getPriqq() {
		return priqq;
	}

	public void setPriqq(int priqq) {
		this.priqq = priqq;
	}

	public int getRefundqq() {
		return refundqq;
	}

	public void setRefundqq(int refundqq) {
		this.refundqq = refundqq;
	}

	public int getCancelqq() {
		return cancelqq;
	}

	public void setCancelqq(int cancelqq) {
		this.cancelqq = cancelqq;
	}

	public int getPrpDlv() {
		return prpDlv;
	}

	public void setPrpDlv(int prpDlv) {
		this.prpDlv = prpDlv;
	}

	public int getDrnDlv() {
		return drnDlv;
	}

	public void setDrnDlv(int drnDlv) {
		this.drnDlv = drnDlv;
	}

	public int getCmpDlv() {
		return cmpDlv;
	}

	public void setCmpDlv(int cmpDlv) {
		this.cmpDlv = cmpDlv;
	}

	@Override
	public String toString() {
		return "adminData [orderCnt=" + orderCnt + ", totPrice=" + totPrice + ", priqq=" + priqq + ", refundqq="
				+ refundqq + ", cancelqq=" + cancelqq + ", prpDlv=" + prpDlv + ", drnDlv=" + drnDlv + ", cmpDlv="
				+ cmpDlv + ", today=" + today + ", nextday=" + nextday + "]";
	}
	
	

}
