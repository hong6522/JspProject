package shop_p;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;
import model_p.PData;
import model_p.ReviewDAO;
import model_p.ReviewDTO;

public class ReFileDelete implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		PData pd = (PData)request.getAttribute("pd");
		
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
			
			dto.setNum(Integer.parseInt(request.getParameter("num")));
			dto.setGid(mm.getParameter("gid"));
			dto.setImg(mm.getParameter("img"));
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		int cnt = new ReviewDAO().fileDelete(dto);
		System.out.println("FileDelete: "+cnt);
		
		String msg = "삭제 완료";
			
			new File(path +"\\" + dto.getImg()).delete();
			
			
		
	 
		System.out.println("ReFileDelete.execute() 실행: " +cnt);
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", "Prd_Detail?code="+dto.getGid()+"&nowPage="+pd.getNowPage());
	}

}
