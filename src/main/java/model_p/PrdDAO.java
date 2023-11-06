package model_p;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PrdDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	
	public PrdDAO() {

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/syso");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int total(){
		
		int res = 0;
		
		sql = "select count(*) from prd where type = 'sg'";
		
		try {
			psmt = con.prepareStatement(sql);
		
			rs = psmt.executeQuery();
			
			rs.next();
				
			res = rs.getInt(1);
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public ArrayList<PrdDTO> prd_list(PData pd){
		ArrayList<PrdDTO> res = new ArrayList<>();
		
		sql = "select * from prd where type = 'sg' limit ?, ?";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, pd.getStart());
			psmt.setInt(2, pd.getLimit());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				PrdDTO dto = new PrdDTO();
				dto.setCode(rs.getString("code"));
				dto.setImg(rs.getString("img"));
				dto.setPrd_name(rs.getString("prd_name"));
				dto.setSail_price(rs.getInt("sail_price"));
				dto.setType(rs.getString("type"));
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public PrdDTO prd_detail(String code){
		
		PrdDTO dto = null;
		
		sql = "select * from prd where code = ?";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, code);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new PrdDTO();
				dto.setCode(rs.getString("code"));
				dto.setImg(rs.getString("img"));
				dto.setPrd_name(rs.getString("prd_name"));
				dto.setSail_price(rs.getInt("sail_price"));
				dto.setContent(rs.getString("content"));
				dto.setImgCnt(rs.getInt("imgCnt"));
				dto.setDetailImg(rs.getString("detailImg"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
	}
	
public PrdDTO ListDetail(String code){
		
		PrdDTO dto = null;
		
		sql = "select * from prd where code = ?";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, code);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new PrdDTO();
				dto.setCode(rs.getString("code"));
				dto.setPrd_name(rs.getString("prd_name"));
				dto.setSail_price(rs.getInt("sail_price"));
				dto.setReal_price(rs.getInt("real_price"));
				dto.setType(rs.getString("type"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				dto.setImg(rs.getString("img"));
				dto.setContent(rs.getString("content"));
				dto.setImgCnt(rs.getInt("imgCnt"));
				dto.setDetailImg(rs.getString("detailImg"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
	}
	
	public ArrayList<PrdDTO> salelist(int m){
		ArrayList<PrdDTO> res = new ArrayList<>();
		sql = "select * from prd where month(reg_date)=? and type=? order by prd_name";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, m);
			psmt.setString(2, "rls");
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				PrdDTO dto = new PrdDTO();
				dto.setImg(rs.getString("img"));
				dto.setPrd_name(rs.getString("prd_name"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				dto.setCode(rs.getString("code"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public PrdDTO sListDetail(String code){
	      PrdDTO dto = null;
	      sql = "select * from prd where code = ?";
	      
	      try {
	         psmt = con.prepareStatement(sql);
	         psmt.setString(1, code);
	         rs = psmt.executeQuery();
	         
	         if(rs.next()) {
	            dto = new PrdDTO();
	            dto.setCode(rs.getString("code"));
	            dto.setContent(rs.getString("content"));
	            dto.setPrd_name(rs.getString("prd_name"));
	            dto.setGender_type(rs.getString("gender_type"));
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	      return dto;
	   }
	
		public int ListInsert(PrdDTO dto){
	      int res = 0;
	    
	      
	      sql = "insert into prd(code, prd_name, sail_price, real_price, type, reg_date, content, img, imgCnt, detailImg) values "
					+ " (?,?,?,?,?,?,?,?,?,?)";
	      try {
	         psmt = con.prepareStatement(sql);
	         psmt.setString(1, dto.getCode());
	         psmt.setString(2, dto.getPrd_name());
	         psmt.setInt(3, dto.getSail_price());
	         psmt.setInt(4, dto.getReal_price());
	         psmt.setString(5, dto.getType());
	         psmt.setString(6, dto.getReg_dateStr());
	         psmt.setString(7, dto.getContent());
	         psmt.setString(8, dto.getImg());
	         psmt.setInt(9, dto.getImgCnt());
	         psmt.setString(10, dto.getDetailImg());
	         
	         res = psmt.executeUpdate();
	        
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	      return res;
	   }
		
		 public int ListDelete(String code){
		      int res = 0;
		      
		      sql = "delete from prd where code = ?";
		      
		      try {
		         psmt = con.prepareStatement(sql);
		         psmt.setString(1, code);
		         
		         res = psmt.executeUpdate();
		         
		        
		      } catch (Exception e) {
		         e.printStackTrace();
		      }finally {
		         close();
		      }
		      
		      return res;
		   }
		 
		 public int ListUpdate(PrdDTO dto){
		      int res = 0;
		      
		      sql = "update prd set prd_name=?, sail_price=?, real_price=?, type=?, reg_date=?, content=?, imgCnt=? where code = ?";
		      
		      try {
		         psmt = con.prepareStatement(sql);
		         
		         
		         psmt.setString(1, dto.getPrd_name());
		         psmt.setInt(2, dto.getSail_price());
		         psmt.setInt(3, dto.getReal_price());
		         psmt.setString(4, dto.getType());
		         psmt.setString(5, dto.getReg_dateStr());
		         psmt.setString(6, dto.getContent());
		         psmt.setInt(7, dto.getImgCnt());
		         psmt.setString(8, dto.getCode());
		         
		         res = psmt.executeUpdate();
		         
		        
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
