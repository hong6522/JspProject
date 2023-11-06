package model_p;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	
	public ReviewDAO() {
		
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
		
		sql = "select count(*) from review";
		
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
	
	public ArrayList<ReviewDTO> review_list(PData pd){
		ArrayList<ReviewDTO> res = new ArrayList<>();
		
		sql = "select * from review";
		
		try {
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setId(rs.getString("id"));
				dto.setNick(rs.getString("nick"));
				dto.setGid(rs.getString("gid"));
				dto.setContent(rs.getString("content"));
				dto.setImg(rs.getString("img"));
				dto.setStar(rs.getInt("star"));
				dto.setNum(rs.getInt("num"));
				dto.setReg_dateStr(rs.getString("reg_date"));
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public int prd_modify(ReviewDTO dto){
		
		int res = 0;
		
		sql = "update review set star = ?, content = ?, img = ? where num = ?";
		
		try {
			
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, dto.getStar());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getImg());
			psmt.setInt(4, dto.getNum());
			
			
			res = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public int review_delete(int num){
		int res = 0;
		
		sql = "delete from review where num = ?";
		
		try {
			
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, num);
			
			res = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public int review_insert(ReviewDTO dto){
		
		int res = 0;
		
		try {
			
			sql = "insert into review(id, nick, gid, content, star, reg_date,img) values "
					+"(?, ?, ?, ?, ?, sysdate(), ?)";
			
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getNick());
			psmt.setString(3, dto.getGid());
			psmt.setString(4, dto.getContent());
			psmt.setInt(5, dto.getStar());
			psmt.setString(6,dto.getImg());
			
			
			res = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public int fileDelete(ReviewDTO dto){
		int res = 0;
		sql = "update review set img = null where num = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getNum());
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
