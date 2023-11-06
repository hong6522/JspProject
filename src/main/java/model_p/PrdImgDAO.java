package model_p;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PrdImgDAO {
	
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	
	public PrdImgDAO() {

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/syso");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int imgInsert(String code , String img){
		
	      int res = 0;
	    
	      sql = "insert into prd_img (code, img) values "
					+ " (?,?)";
	      try {
	         psmt =con.prepareStatement(sql);
	         psmt.setString(1, code);
	         psmt.setString(2, img);
	         
	         res = psmt.executeUpdate();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	      return res;
	   }
	
	public ArrayList<PrdImgDTO> prdImglist(String code){
        ArrayList<PrdImgDTO> res = new ArrayList<>();

        sql = "select * from prd_img where code=?";

        try {
            psmt = con.prepareStatement(sql);

            psmt.setString(1, code);



            rs = psmt.executeQuery();
            while(rs.next()) {
                PrdImgDTO dto = new PrdImgDTO();

                dto.setCode(rs.getString("code"));
                dto.setImg(rs.getString("img"));

                res.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }

        return res;
    }
	
	public int del(String img) {
		int res = 0;
		sql = "delete from prd_img where img = ?";
		
		try {
			// 아이디랑 일치하는 쿼리를 가져와서, 해당 id의 bklist를 no로 변경
			psmt = con.prepareStatement(sql);
			psmt.setString(1, img);
			res =  psmt.executeUpdate();	
			System.out.println(res);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} 
		return res;
	}
	
	public void close() {
		if(rs!=null)try {rs.close();} catch(Exception e) {}
		if(psmt!=null)try {psmt.close();} catch(Exception e) {}
		if(con!=null)try {con.close();} catch(Exception e) {}
	}
}
