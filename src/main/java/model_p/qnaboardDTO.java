package model_p;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class qnaboardDTO {
	
	String id,kind,content,content2,state;
	Date reg_date;
	int order_no,no;

	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
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
	
	
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	@Override
	public String toString() {
		return "qnaboardDTO [id=" + id + ", kind=" + kind + ", content=" + content + ", content2=" + content2
				+ ", state=" + state + ", reg_date=" + reg_date + ", order_no=" + order_no + ", no=" + no + ", sdf="
				+ sdf + "]";
	}
	
	

}
