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

 
public class qnaboardDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	
	public qnaboardDAO() {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/syso");
			con = ds.getConnection();

		} catch (Exception e) {
			
			e.printStackTrace();
		}	
	}
	
	//관리자 전체문의 내역확인
	public ArrayList<qnaboardDTO> list(){
		ArrayList<qnaboardDTO> res = new ArrayList<>();
		sql = "select * from qnaboard";

		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				qnaboardDTO dto = new qnaboardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setKind(rs.getString("kind"));
				dto.setContent(rs.getString("content"));
				dto.setState(rs.getString("state"));
				dto.setContent2(rs.getString("content2"));
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	//답변 상태별 조회
	public ArrayList<qnaboardDTO> statelist(String state){
		ArrayList<qnaboardDTO> res = new ArrayList<>();
		System.out.println("ttt메소드");

		
		sql = "select * from qnaboard where state = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, state); 
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				qnaboardDTO dto = new qnaboardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setKind(rs.getString("kind"));
				dto.setContent(rs.getString("content"));
				dto.setState(rs.getString("state"));
				dto.setContent2(rs.getString("content2"));
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	//나의 문의내역
	public ArrayList<qnaboardDTO> list(String id){
		ArrayList<qnaboardDTO> res = new ArrayList<>();
		
		
		sql = "select * from qnaboard where id = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id); 
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				qnaboardDTO dto = new qnaboardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setKind(rs.getString("kind"));
				dto.setContent(rs.getString("content"));
				dto.setState(rs.getString("state"));
				dto.setContent2(rs.getString("content2"));
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	//문의 디테일 페이지
	public qnaboardDTO detail(String no){
		qnaboardDTO dto = new qnaboardDTO();
		int num = Integer.parseInt(no);
		System.out.println(num);
		
		sql = "select * from qnaboard where no = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num); 
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("ttt");

				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setKind(rs.getString("kind"));
				dto.setContent(rs.getString("content"));
				dto.setState(rs.getString("state"));
				dto.setContent2(rs.getString("content2"));
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setReg_dateStr(rs.getString("reg_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		System.out.println();
		
		return dto;
	}
	
	
	
	public int insert(qnaboardDTO dto){
		int res = 0;
		sql = "insert into qnaboard (id, kind, content, reg_date, order_no) values "
				+ " (?,?,?,sysdate(),?)";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getKind());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, dto.getOrder_no());
			
			res = psmt.executeUpdate();	
			System.out.println(res);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}	
		return res;
	}
	
	public int modify(qnaboardDTO dto) {
		int res = 0;
		System.out.println(dto.toString());
		
		sql = "update qnaboard set content2 = ?, state = ? where no = ?";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getContent2());
			psmt.setString(2, dto.getState());
			psmt.setInt(3, dto.getNo());

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
	
				
	
	void close() {
		if(rs!=null)  try { rs.close();}   catch (SQLException e) {}
		if(psmt!=null)try { psmt.close();} catch (SQLException e) {}
		if(con!=null) try { con.close();}  catch (SQLException e) {}
	}
}
