package model_p;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReviewDTO {

	String id, nick, gid, content, img;
	int num, star;
	Date reg_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
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
	
	public String getImg() {
		if(img==null||img.equals("null")||img.equals("")) {
			img = "notImg.jpg";
		}
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getContent() {
		return content;
	}
	public String getContentBr() {
		return content.replaceAll("\n", "<br/>");
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
}
