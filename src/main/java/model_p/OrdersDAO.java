package model_p;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

public class OrdersDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	String [] arr = null;

	
	public OrdersDAO() {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/syso");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public OrdersDTO orderNo_Find(OrdersDTO dto){
		
		
		try {
			
			sql = "insert into orders(id, code, cnt, address, reg_date, dlvryStts, cardMk, cardNum, orderStts, client, totpri) values "
					+"(?, ?, ?, ?, sysdate(), '배송준비중', ?, ?, '결제완료', ?, ?)";
			
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getCode());
			psmt.setInt(3, dto.getCnt());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getCardMk());
			psmt.setString(6, dto.getCardNum());
			psmt.setString(7, dto.getClient());
			psmt.setInt(8, dto.getTotpri());
			
			psmt.executeUpdate();
			
			sql = "select max(order_no) from orders";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			dto.setOrder_no(rs.getInt(1));
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
	}
	
	public OrdersDTO orderDetail(int order_no){
		
		OrdersDTO dto = null;
		sql = "select orders.*,prd_name, img from orders left outer join prd on orders.code =prd.code where order_no = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, order_no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new OrdersDTO();
				dto.setId(rs.getString("id"));
				dto.setPrd_name(rs.getString("prd_name"));
				dto.setCode(rs.getString("code"));
				dto.setClient(rs.getString("client"));
				dto.setAddress(rs.getString("address"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setCardMk(rs.getString("cardMk"));
				dto.setCardNum(rs.getString("cardNum"));
				dto.setDlvryStts(rs.getString("dlvryStts"));
				dto.setImg(rs.getString("img"));
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setOrderStts(rs.getString("orderStts"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				dto.setTotpri(rs.getInt("totpri"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
	}
	
	
	public ArrayList<OrdersDTO> adminSales(String startDate, String endDate){
		
		ArrayList<OrdersDTO> res = new ArrayList<>();
		
		sql = "select * from orders where reg_date between ? and ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, startDate);
			psmt.setString(2, endDate);

			rs = psmt.executeQuery();
			
			while(rs.next()) {
				OrdersDTO dto = new OrdersDTO();
				dto.setOrder_no(rs.getInt("order_no"));

				dto.setId(rs.getString("id"));
				dto.setClient(rs.getString("client"));
				dto.setCode(rs.getString("code"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setTotpri(rs.getInt("totpri"));
				dto.setAddress(rs.getString("address"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				dto.setDlvryStts(rs.getString("dlvryStts"));
				dto.setCardMk(rs.getString("cardMk"));
				dto.setCardNum(rs.getString("cardNum"));
				dto.setOrderStts(rs.getString("orderStts"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}
	
	//주문번호
	public int cancel(int order_no){
		
		int res = 0;
		sql = "update orders set orderStts = '취소요청' where order_no = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, order_no);

			res =  psmt.executeUpdate();	
			System.out.println("취소요청 완료:"+res);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}
	
	
	public int ordersUpdate(OrdersDTO dto){
	      int res = 0;
	      
	      sql = "update orders set dlvrystts=? where order_no=?";
	      
	      try {
	         psmt = con.prepareStatement(sql);
	         
	         psmt.setString(1, dto.getDlvryStts());
	         psmt.setInt(2, dto.getOrder_no());
	         
	         res = psmt.executeUpdate();
	         
	        
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	      return res;
	   }
	public ArrayList<OrdersDTO> orderlist(HttpServletRequest request){
		ArrayList<OrdersDTO> res = new ArrayList<>();
		
		System.out.println(request.getParameter("dlvrystts"));
		
		//sql = "select * from orders where reg_date=? order by order_no";
		sql = "select * from orders where dlvrystts=?";

		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, request.getParameter("dlvrystts"));
			
			
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				OrdersDTO dto = new OrdersDTO();
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setId(rs.getString("id"));
				dto.setClient(rs.getString("client"));
				dto.setCode(rs.getString("code"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setTotpri(rs.getInt("totpri"));
				dto.setAddress(rs.getString("address"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				dto.setDlvryStts(rs.getString("dlvryStts"));
				dto.setCardMk(rs.getString("cardmk"));
				dto.setCardNum(rs.getString("cardnum"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	
	
	public ArrayList<OrdersDTO> orderlist(String reg){
		ArrayList<OrdersDTO> res = new ArrayList<>();
		
		
		if(reg != null) {
			arr = reg.split("-");
		}
		
		//sql = "select * from orders where reg_date=? order by order_no";
		sql = "select * from orders where year(reg_date) = ? and month(reg_date) = ? and day(reg_date) = ?  order by order_no";

		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, arr[0]);
			psmt.setString(2, arr[1]);
			psmt.setString(3, arr[2]);
			
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				OrdersDTO dto = new OrdersDTO();
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setId(rs.getString("id"));
				dto.setClient(rs.getString("client"));
				dto.setCode(rs.getString("code"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setTotpri(rs.getInt("totpri"));
				dto.setAddress(rs.getString("address"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				dto.setDlvryStts(rs.getString("dlvryStts"));
				dto.setCardMk(rs.getString("cardmk"));
				dto.setCardNum(rs.getString("cardnum"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	
	
	public ArrayList<OrdersDTO> orderlist(String reg , String type){
		ArrayList<OrdersDTO> res = new ArrayList<>();
		
		
		if(reg != null) {
			arr = reg.split("-");
		}
		
		//sql = "select * from orders where reg_date=? order by order_no";
		sql = "select * from orders where year(reg_date) = ? and month(reg_date) = ? and day(reg_date) = ? and dlvryStts=? order by order_no";

		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, arr[0]);
			psmt.setString(2, arr[1]);
			psmt.setString(3, arr[2]);
			psmt.setString(4, type);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				OrdersDTO dto = new OrdersDTO();
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setId(rs.getString("id"));
				dto.setClient(rs.getString("client"));
				dto.setCode(rs.getString("code"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setTotpri(rs.getInt("totpri"));
				dto.setAddress(rs.getString("address"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				dto.setDlvryStts(rs.getString("dlvryStts"));
				dto.setCardMk(rs.getString("cardmk"));
				dto.setCardNum(rs.getString("cardnum"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
public ArrayList<OrdersDTO> deliveryReady(){
		
		ArrayList<OrdersDTO> res = new ArrayList<>();
		
		sql = "select * from orders where dlvryStts=?";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, "배송준비중");
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				OrdersDTO dto = new OrdersDTO();
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setId(rs.getString("id"));
				dto.setClient(rs.getString("client"));
				dto.setCode(rs.getString("code"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setTotpri(rs.getInt("totpri"));
				dto.setAddress(rs.getString("address"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				dto.setDlvryStts(rs.getString("dlvryStts"));
				dto.setCardMk(rs.getString("cardMk"));
				
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}

public ArrayList<OrdersDTO> deliveryCancel(){
	
	ArrayList<OrdersDTO> res = new ArrayList<>();
	
	sql = "select * from orders where dlvryStts=?";
	
	try {
		psmt = con.prepareStatement(sql);
		
		psmt.setString(1, "취소요청");

		rs = psmt.executeQuery();
		
		while(rs.next()) {
			OrdersDTO dto = new OrdersDTO();
			dto.setOrder_no(rs.getInt("order_no"));
			dto.setId(rs.getString("id"));
			dto.setClient(rs.getString("client"));
			dto.setCode(rs.getString("code"));
			dto.setCnt(rs.getInt("cnt"));
			dto.setTotpri(rs.getInt("totpri"));
			dto.setAddress(rs.getString("address"));
			dto.setReg_dateStr(rs.getString("reg_date"));
			dto.setDlvryStts(rs.getString("dlvryStts"));
			dto.setCardMk(rs.getString("cardMk"));
			dto.setCardNum(rs.getString("cardNum"));
			
			res.add(dto);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}

	return res;
}

public ArrayList<OrdersDTO> deliveryFinish(){
	
	ArrayList<OrdersDTO> res = new ArrayList<>();
	
	sql = "select * from orders where dlvryStts=?";
	
	try {
		psmt = con.prepareStatement(sql);
		
		psmt.setString(1, "배송완료");

		rs = psmt.executeQuery();
		
		while(rs.next()) {
			OrdersDTO dto = new OrdersDTO();
			dto.setOrder_no(rs.getInt("order_no"));
			dto.setId(rs.getString("id"));
			dto.setClient(rs.getString("client"));
			dto.setCode(rs.getString("code"));
			dto.setCnt(rs.getInt("cnt"));
			dto.setTotpri(rs.getInt("totpri"));
			dto.setAddress(rs.getString("address"));
			dto.setReg_dateStr(rs.getString("reg_date"));
			dto.setDlvryStts(rs.getString("dlvryStts"));
			dto.setCardMk(rs.getString("cardMk"));
			dto.setCardNum(rs.getString("cardNum"));
			
			res.add(dto);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}

	return res;
}

public ArrayList<OrdersDTO> list(){
	
	ArrayList<OrdersDTO> res = new ArrayList<>();
	
	sql = "select * from orders";
	
	try {
		psmt = con.prepareStatement(sql);
		rs = psmt.executeQuery();
		
		while(rs.next()) {
			OrdersDTO dto = new OrdersDTO();
			dto.setOrder_no(rs.getInt("order_no"));
			dto.setId(rs.getString("id"));
			dto.setClient(rs.getString("client"));
			dto.setCode(rs.getString("code"));
			dto.setCnt(rs.getInt("cnt"));
			dto.setTotpri(rs.getInt("totpri"));
			dto.setAddress(rs.getString("address"));
			dto.setReg_dateStr(rs.getString("reg_date"));
			dto.setDlvryStts(rs.getString("dlvryStts"));
			dto.setCardMk(rs.getString("cardMk"));
			dto.setCardNum(rs.getString("cardNum"));
			
			res.add(dto);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}

	return res;
}
	
	
	public void close() {
		if(rs!=null)try {rs.close();} catch(Exception e) {}
		if(psmt!=null)try {psmt.close();} catch(Exception e) {}
		if(con!=null)try {con.close();} catch(Exception e) {}
	}
	
}
