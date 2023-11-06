package model_p;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MarkDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	
	public MarkDAO() {

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/syso");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

	
	public int MarkInsert(String id , String name){
	      int res = 0;
	    
	      
	      sql = "insert into mark (id, markcode) values "
					+ " (?,?)";
	      try {
	         psmt =con.prepareStatement(sql);
	         psmt.setString(1, id);
	         psmt.setString(2, name);
	         
	         res = psmt.executeUpdate();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	      return res;
	   }
	
	public int MarkDelete(String id , String code){
	      int res = 0;
	      
	      sql = "delete from mark where id = ? and markcode = ?";
	      
	      try {
	         psmt = con.prepareStatement(sql);
	         psmt.setString(1, id);
	         psmt.setString(2, code);
	         
	         
	         res = psmt.executeUpdate();
	         
	        
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	      return res;
	   }
	
	public boolean MarkChk(String id , String code) {
		boolean res = false;
		
		sql = "select * from mark where id=? and markcode=?";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, code);
			
			rs = psmt.executeQuery();
			
			res = rs.next();
		} catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	      return res;
	   } 
	
	public ArrayList<MarkDTO> MarkList(String id){
		ArrayList<MarkDTO> res = new ArrayList<>();
		

		
		sql = "select * from mark join prd on markcode = code where id = ?";
		//sql = "select * from mark where id = ?";

		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MarkDTO dto = new MarkDTO();
				dto.setId(rs.getString("id"));
				dto.setMarkcode(rs.getString("markcode"));
				dto.setPname(rs.getString("prd_name"));
				
				res.add(dto);

			}
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
