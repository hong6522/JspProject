package model_p;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class stlDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	
	public stlDAO() {

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/syso");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<stlDTO> stlList(String reg_date){
		ArrayList<stlDTO> res = new ArrayList<>();

		sql = "select * from stl where reg_date = ?";
		
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, reg_date);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				stlDTO dto = new stlDTO();
				dto.setStl_no(rs.getInt("stl_no"));
				dto.setContent(rs.getString("content"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				dto.setPrice(rs.getInt("price"));
				dto.setKind(rs.getString("kind"));

				
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return res;
	}
	
	public ArrayList<stlDTO> stlList(String year, String month){
		ArrayList<stlDTO> res = new ArrayList<>();
		//SELECT * FROM stl WHERE YEAR(reg_date) = 2023 AND MONTH(reg_date) = 3;
		System.out.println("여기하나?");

		sql = "select * from stl where year(reg_date) = ? and month(reg_date) = ?";
		
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, year);
			psmt.setString(2, month);

			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				stlDTO dto = new stlDTO();
				dto.setStl_no(rs.getInt("stl_no"));
				dto.setContent(rs.getString("content"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				dto.setPrice(rs.getInt("price"));
				dto.setKind(rs.getString("kind"));

				
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return res;
	}
	
	public int delete(String no){
		int res = 0;
		int stlNo = Integer.parseInt(no);
		
		sql = "delete from stl where stl_no = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, stlNo);
			
			res = psmt.executeUpdate();	
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}	
		return res;
	}	
	
	public int insert(stlDTO dto){
		int res = 0;
		sql = "insert into stl (content, reg_date, price, kind) values (?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getContent());
			psmt.setString(2, dto.getReg_dateStr());
			psmt.setInt(3, dto.getPrice());
			psmt.setString(4, dto.getKind());
			
			res = psmt.executeUpdate();			
			System.out.println(res);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
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
