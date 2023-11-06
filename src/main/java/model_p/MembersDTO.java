package model_p;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MembersDTO {
// id, pw, pname, nick, birth, tel, email, address, level 
	int level,bklist;
	String id, pname, pw, tel, address, nick, email,qq, aa;
	Date birth;
	
	
	public int getBklist() {
		return bklist;
	}
	public void setBklist(int bklist) {
		this.bklist = bklist;
	}
	public int getLevel() {
		return level;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getAa() {
		return aa;
	}
	public void setAa(String aa) {
		this.aa = aa;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public Date getbirth() {
		return birth;
	}
	public void setbirth(Date birth) {
		this.birth = birth;
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public String getbirthStr() {
		return  sdf.format(birth);
	}
	
	public void setbirthStr(String birth) {
		try {
			this.birth = sdf.parse(birth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	
	@Override
	public String toString() {
		return "MembersDTO [level=" + level + ", id=" + id + ", pname=" + pname + ", pw=" + pw + ", tel=" + tel
				+ ", address=" + address + ", nick=" + nick + ", email=" + email + ", birth=" + birth + ", sdf=" + sdf
				+ "]";
	}

 	
	
	
}
