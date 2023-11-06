package model_p;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//id, pw, pname, nick, birth, tel, email, address, level 
// -> level 로 관리자/ 일반회원 
public class MembersDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	
	public MembersDAO() {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/syso");
			con = ds.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	// 관리자가 가입된 멤버들 목록을 보는 메소드
	// 회원(dto)목록을 리턴하기때문에 arrayList로 리턴
	public ArrayList<MembersDTO> memList() {
		
		ArrayList<MembersDTO> res = new ArrayList<>();
		sql = "select * from members";

		try {
			psmt = con.prepareStatement(sql);

			rs = psmt.executeQuery();		
			
			while(rs.next()) {
				MembersDTO dto = new MembersDTO();
				dto.setId(rs.getString("id"));
				dto.setPname(rs.getString("pname"));
				dto.setNick(rs.getString("nick"));
				dto.setbirthStr(rs.getString("birth"));
				dto.setTel(rs.getString("tel"));
				dto.setLevel(rs.getInt("level"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setBklist(rs.getInt("bklist"));
				res.add(dto);			
			}

		} catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			close();
		}
		return res;
	}
	
	public ArrayList<MembersDTO> memList(String kind, String sch) {
		System.out.println(kind +""+ sch);
		ArrayList<MembersDTO> res = new ArrayList<>();
		sql = "select * from members where "+kind+" = ?";
		System.out.println(sql);

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, sch);

			rs = psmt.executeQuery();		
			
			while(rs.next()) {
				MembersDTO dto = new MembersDTO();
				dto.setId(rs.getString("id"));
				dto.setPname(rs.getString("pname"));
				dto.setNick(rs.getString("nick"));
				dto.setbirthStr(rs.getString("birth"));
				dto.setTel(rs.getString("tel"));
				dto.setLevel(rs.getInt("level"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setBklist(rs.getInt("bklist"));
				res.add(dto);			
			}

		} catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			close();
		}
		return res;
	}
	
		
	// 아이디 패스워드 확인 후 세션에 저장될 데이터를 리턴하는 메소드 (세션에 필요한 데이터 id, nick, 레벨)
	public SessionData loginChk(String id, String pw) {
		
		SessionData sd = null;
		
		// sql members테이블에서 id, pw값으로 세팅
		sql = "select * from members where id = ? and pw = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();		
			
			//rs.next()가 true가 되려면 아이디 패스워드로 db에서 검색했을 때 유효한 데이터가 있어야함
			//rs.next()가 db에에서 유효한 데이터가 없으면 while문을 실행하지 않기때문에 sd가 생성이 되자않음, SessionData가 null로 리턴됨
			while(rs.next()) {
				sd = new SessionData();
				sd.setId(rs.getString("id"));
				sd.setNick(rs.getString("nick"));
				sd.setLevel(rs.getInt("level"));
				
				if(rs.getInt("level") == 1) {
					sd = null;
				}
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			close();
		}
		return sd;
	}
		
	
	// 마이페이지, MembersDTO형태로 리턴됨
	public MembersDTO myPage(String id) {
		
		MembersDTO dto = null;
		//id값을 매개변수로 받아서 db에서 검색
		sql = "select * from members where id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			System.out.println(id);
			
			// db에서 가져온 값을 dto에 대입 후 dto리턴
			while(rs.next()) {
				dto = new MembersDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setPname(rs.getString("pname"));
				dto.setNick(rs.getString("nick"));
				dto.setbirth(rs.getDate("birth"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setLevel(rs.getInt("level"));
				dto.setQq(rs.getString("pwq"));
				dto.setAa(rs.getString("pwa"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			close();
		}
		return dto;
	}
	
		public int bklist(String id, int no) {
			int res = 0;
			
			//아이디를 받아와서 해당 테이블의 bklist를 0or1로 
			if(no == 1) {
				no = 0;
			}else {
				no = 1;
			}
			
			MembersDTO dto = null;
			sql = "update members set bklist = ? where id = ?";
			
			try {

				// 아이디랑 일치하는 쿼리를 가져와서, 해당 id의 bklist를 no로 변경
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, no);
				psmt.setString(2, id);
				res =  psmt.executeUpdate();	
				System.out.println(res);
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			} finally {
				close();
			}
			return res;
		}
		
		public int modify(MembersDTO dto) {
			int res = 0;
			
			sql = "update members set pname = ?, nick = ?, birth = ?, tel = ?, email = ?, address = ? where id = ?";
			
			try {

				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getNick());
				psmt.setString(3, dto.getbirthStr());
				psmt.setString(4, dto.getTel());
				psmt.setString(5, dto.getEmail());
				psmt.setString(6, dto.getAddress());
				psmt.setString(7, dto.getId());


				res =  psmt.executeUpdate();	
				System.out.println(res);
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			} finally {
				close();
			}
			return res;
		}
		
		public int chenlevel(String id, String level) {
			int res = 0;
			System.out.println("id:"+id+"level"+level);
			int no = Integer.parseInt(level);			

			sql = "update members set level = ? where id = ?";
			
			try {

				// 아이디랑 일치하는 쿼리를 가져와서, 해당 id의 bklist를 no로 변경
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, no);
				psmt.setString(2, id);
				res =  psmt.executeUpdate();	
				System.out.println(res);
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			} 
			return res;
		}
		
		public int memdelete(String id) {
			int res = 0;
			sql = "delete from members where id = ?";
			
			try {
				// 아이디랑 일치하는 쿼리를 가져와서, 해당 id의 bklist를 no로 변경
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				res =  psmt.executeUpdate();	
				System.out.println(res);
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			} 
			return res;
		}
		
		
		public int insert(MembersDTO dto){  
			int res = 0; // 정상출력 확인을 위해 res = 0 을 한것같은데 그럼 public int 로 한 이유도 이거때문인가 
			sql = "insert into members (id, pw, pname, birth, nick, tel, email, address, pwq, pwa) values "
					+ " (?,?,?,?,?,?,?,?,?,?)"; // db에 있는 저 컬럼의 값들을 추가하겠다 
			
			try {
				psmt = con.prepareStatement(sql); // prepareStatement에 sql 문을 전달해서 prepareStatement 객체를 생성한다  
				
				psmt.setString(1, dto.getId()); // ? 인덱스 , 인덱스에 들어갈 값 (id)
				psmt.setString(2, dto.getPw());
				psmt.setString(3, dto.getPname());
				psmt.setString(4, dto.getbirthStr());
				psmt.setString(5, dto.getNick());
				psmt.setString(6, dto.getTel());
				psmt.setString(7, dto.getEmail());
				psmt.setString(8, dto.getAddress());
				psmt.setString(9, dto.getQq());
				psmt.setString(10, dto.getAa());
				res = psmt.executeUpdate(); // int 타입의 값을 반환한다(select 제외) select 는 executeQuery 	
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}	
			return res;
		}
		
		public int pwmodify(String pw, String id ){
			int res = 0;
			sql = "update members set pw = ? where id = ?";
			
			try {
				psmt = con.prepareStatement(sql);
				
				psmt.setString(1, pw);
				psmt.setString(2, id);
				
				res = psmt.executeUpdate();	
				System.out.println("pw "+pw);
				System.out.println("res "+res);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}	
			return res;
		}
		
		//나의 주문목록
		public ArrayList<OrdersDTO> myOrder(String id){
			ArrayList<OrdersDTO> res = new ArrayList<>();
//			sql = "select * from mark join prd on markcode = code where id = ?";

//			sql = "select * from orders join prd on code = code where id = ?";

			
			sql = "select *,o.reg_date from prd p join orders o on p.code = o.code where o.id = ? order by order_no desc" ;


			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					OrdersDTO dto = new OrdersDTO();
					dto.setPrd_name(rs.getString("prd_name"));
					dto.setOrder_no(rs.getInt("order_no"));
					dto.setId(rs.getString("id"));
					dto.setClient(rs.getString("client"));
					dto.setCode(rs.getString("code"));
					dto.setCnt(rs.getInt("cnt"));
					dto.setTotpri(rs.getInt("totpri"));
					dto.setAddress(rs.getString("address"));
					dto.setReg_date(rs.getDate("o.reg_date"));
					
					System.out.println(rs.getDate("o.reg_date"));
					
					dto.setDlvryStts(rs.getString("dlvryStts"));
					dto.setCardMk(rs.getString("cardMk"));
					dto.setCardNum(rs.getString("cardNum"));
					dto.setOrderStts(rs.getString("orderStts"));
					res.add(dto);
				}
				     				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}	
			return res;
		}
		
		
	
	void close() {
		if(rs!=null)  try { rs.close();}   catch (SQLException e) {}
		if(psmt!=null)try { psmt.close();} catch (SQLException e) {}
		if(con!=null) try { con.close();}  catch (SQLException e) {}
	}
}
