package shop_p;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.OrdersDAO;
import model_p.OrdersDTO;
import model_p.PData;
import model_p.PrdDAO;
import model_p.PrdDTO;
import model_p.ReviewDAO;
import model_p.ReviewDTO;
import model_p.SessionData;

public class Prd_insert implements Service{

	public void execute(HttpServletRequest request , HttpServletResponse response) {

		PData pd = (PData)request.getAttribute("pd");
		
        HttpSession session = request.getSession();

        SessionData sd = (SessionData)session.getAttribute("SessionData");
       
        String path = request.getRealPath("/prdImg");
		path = "C:\\jyt\\javaWork\\KRProj\\src\\main\\webapp\\prdImg";
		
		ReviewDTO dto =new ReviewDTO();
		try {
			MultipartRequest mm = new MultipartRequest(
					request, 
					path, 
					10*1024*1024,
					"utf-8", 
					new DefaultFileRenamePolicy());
			
			pd.setNowPage(Integer.parseInt(mm.getParameter("nowPage")));
			
			dto.setId(sd.getId());
	        dto.setNick(sd.getNick());
	        dto.setGid(mm.getParameter("gid"));
	        dto.setContent(mm.getParameter("content"));
	        dto.setStar(Integer.parseInt(mm.getParameter("star")));
	        dto.setImg(mm.getFilesystemName("img"));
	        
	        
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        
        
        int cnt = new ReviewDAO().review_insert(dto);
        
        String msg = "리뷰 작성을 완료 하였습니다.";
		String goUrl = "Prd_Detail?code="+dto.getGid()+"&nowPage="+pd.getNowPage();
		
		System.out.println("Prd_insert.execute() 실행: "+cnt);
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);

    }
	
}
