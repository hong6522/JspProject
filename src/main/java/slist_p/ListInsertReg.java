package slist_p;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;
import model_p.PrdDAO;
import model_p.PrdDTO;
import model_p.PrdImgDAO;
import model_p.PrdImgDTO;

public class ListInsertReg implements Service {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		ArrayList<File> arr = (ArrayList<File>)session.getAttribute("fileData");
		
		System.out.println(arr.size());

		String path = request.getRealPath("/fff");
		
		path = "C:\\hongkh\\study\\javaWork\\KRProj\\src\\main\\webapp\\prdImg";
		
		PrdDTO dto = new PrdDTO();
		
		try {
			MultipartRequest mm = new MultipartRequest(request,
					path,
					10*1024*1024,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
			System.out.println(mm.getParameter("reg_date"));
			dto.setPrd_name(mm.getParameter("prd_name"));;
			dto.setSail_price(Integer.parseInt(mm.getParameter("sail")));
			dto.setReal_price(Integer.parseInt(mm.getParameter("real")));
			dto.setType(mm.getParameter("type"));
			dto.setReg_dateStr(mm.getParameter("reg_date"));
			dto.setImg(mm.getParameter("img"));
			//dto.setImgCnt(Integer.parseInt(mm.getParameter("imgcnt")));
			
			dto.setImgCnt(arr.size());

			dto.setDetailImg(mm.getParameter("detailImg"));
			dto.setContent(mm.getParameter("content"));

					
			dto.setCode(mm.getParameter("code"));

			 Iterator it = (Iterator) mm.getFileNames(); 
			
			 
			 
			 for(File  dtoo : arr) {
				 
				PrdImgDAO idao = new PrdImgDAO();
				PrdImgDTO idto = new PrdImgDTO();
				 
				idao.imgInsert(mm.getParameter("code"), dtoo.getName());
				dto.setImg(dtoo.getName());

			 }
			 
			 

			System.out.println("it.hasNext()"+it.hasNext()+"길이()");

			
			while(it.hasNext()) {
				System.out.println("while문 들어오나요?");

				
				System.out.println((String)it.next());

				String ff = (String)it.next();
				File fff = mm.getFile(ff);

				System.out.println();

			}
			
			
			
			

			
			
		} catch (Exception e) {
			
			System.out.println("에러입니까?"+e.getMessage());
			// TODO: handle exception
		}
		
		
		int cnt =  new PrdDAO().ListInsert(dto); 
		
		
		
		session.removeAttribute("fileData");
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", "작성하였습니다.");
		request.setAttribute("goUrl", "SList");
		
		
		
		
	}

}