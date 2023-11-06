package model_p;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PrdDTO {

	int sail_price, real_price, imgCnt;
	String code, prd_name, type, content, img, detailImg ,gender_type;
	Date reg_date;
	
	public int getSail_price() {
		return sail_price;
	}
	public void setSail_price(int sail_price) {
		this.sail_price = sail_price;
	}
	
	public int getReal_price() {
		return real_price;
	}
	public void setReal_price(int real_price) {
		this.real_price = real_price;
	}
	
	public int getImgCnt() {
		return imgCnt;
	}
	public void setImgCnt(int imgCnt) {
		this.imgCnt = imgCnt;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getPrd_name() {
		return prd_name;
	}
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	
	public String getImg() {
		if(img==null||img.equals("null")) {
			img = "notImg.jpg";
		}
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public String getDetailImg() {
		return detailImg;
	}
	public void setDetailImg(String detailImg) {
		this.detailImg = detailImg;
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
	public String getGender_type() {
		
		if(gender_type==null || gender_type.equals("null")) {
			gender_type = "남/여 공용";
		}
		
		return gender_type;
	}
	public void setGender_type(String gender_type) {
		
		
		this.gender_type = gender_type;
	}
	
	
}
