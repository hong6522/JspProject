package model_p;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class stlDTO {
	int stl_no;
	String content;
	Date reg_date;
	int price;
	String kind;
	
	
	public int getStl_no() {
		return stl_no;
	}
	public void setStl_no(int stl_no) {
		this.stl_no = stl_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public String getReg_dateStr() {
		return  sdf.format(reg_date);
	}
	
	public void setReg_dateStr(String reg_date) {
		try {
			this.reg_date = sdf.parse(reg_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	
}
