package slist_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;
import model_p.PrdDAO;
import model_p.PrdDTO;

public class ListUpdateReg implements Service {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String path = request.getRealPath("/prdImg");
		path = "C:\\hongkh\\study\\javaWork\\KRProj\\src\\main\\webapp\\prdImg";
		
		
		
		PrdDTO dto = new PrdDTO();
		
		try {
			MultipartRequest mm = new MultipartRequest(
					request, 
					path, 
					10*1024*1024,
					"utf-8", 
					new DefaultFileRenamePolicy());

			
			dto.setCode(mm.getParameter("code"));
			dto.setPrd_name(mm.getParameter("prd_name"));;
			dto.setSail_price(Integer.parseInt(mm.getParameter("sail")));
			dto.setReal_price(Integer.parseInt(mm.getParameter("real")));
			dto.setType(mm.getParameter("type"));
			dto.setReg_dateStr(mm.getParameter("reg_date"));
			dto.setImg(mm.getParameter("img"));
			//dto.setImgCnt(Integer.parseInt(request.getParameter("imgcnt")));
			dto.setDetailImg(mm.getParameter("detailImg"));
			dto.setContent(mm.getParameter("content"));
			
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());

			// TODO: handle exception
		}
		
		new PrdDAO().ListUpdate(dto); 
		System.out.println(dto.getCode());

		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", "수정하였습니다.");
		request.setAttribute("goUrl", "SListDetail?code="+dto.getCode());
		
		
		
		
	}

}
