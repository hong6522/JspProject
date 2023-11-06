package model_p;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrdersDTO {

	String id, code, client, address, dlvryStts, cardMk, cardNum, orderStts, prd_name, img;
	int order_no, cnt, totpri;
	Date reg_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDlvryStts() {
		return dlvryStts;
	}
	public void setDlvryStts(String dlvryStts) {
		this.dlvryStts = dlvryStts;
	}
	public String getCardMk() {
		return cardMk;
	}
	public void setCardMk(String cardMk) {
		this.cardMk = cardMk;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getOrderStts() {
		return orderStts;
	}
	public void setOrderStts(String orderStts) {
		this.orderStts = orderStts;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	
	public String getReg_dateStr() {
		return sdf.format(reg_date);
	}
	public void setReg_dateStr(String reg_date) {
		try {
			this.reg_date = sdf.parse(reg_date);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getPrd_name() {
		return prd_name;
	}
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
	public String getImg() {
		if(img==null||img.equals("null")) {
			img = "notImg.jpg";
		}
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getTotpri() {
		return totpri;
	}        
	public void setTotpri(int totpri) {
		this.totpri = totpri;
	}
	
	@Override
	public String toString() {
		return "<td>" + order_no + "</td><td>" + id +"</td><td>" + client+"</td><td>" + code
				+"</td><td>" + cnt+"</td><td>" + totpri+"</td><td>" + address+"</td><td>" + getReg_dateStr()+"</td><td>" + dlvryStts+"</td><td>" + cardMk+"</td><td>" + orderStts + "</td>";
	}
	
	
	
	
}
