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
import model_p.BoardDTO;
import model_p.PrdDAO;
import model_p.PrdDTO;
import model_p.PrdImgDAO;
import model_p.PrdImgDTO;

public class ListUpdateForm implements Service {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		PrdDTO UpdateData = new PrdDAO().ListDetail(request.getParameter("code"));
		ArrayList<PrdImgDTO> arr = null;
		PrdImgDAO idao = new PrdImgDAO();

		if(request.getParameter("code") != null) {
			arr =  idao.prdImglist(request.getParameter("code"));

		}
		
		String path = request.getRealPath("/prdImg");
		path = "C:\\hongkh\\study\\javaWork\\KRProj\\src\\main\\webapp\\prdImg";
		
		try {
			MultipartRequest mm = new MultipartRequest(
					request, 
					path, 
					10*1024*1024,
					"utf-8", 
					new DefaultFileRenamePolicy());
			

			
			idao = new PrdImgDAO();


			
			  Iterator it = (Iterator) mm.getFileNames(); 
			  
			  System.out.println("it.hasNext()"+it.hasNext());
			  UpdateData = new PrdDAO().ListDetail(mm.getParameter("code"));
			  
				while(it.hasNext()) {
					System.out.println("들어오나요?");
					idao = new PrdImgDAO();

					String ff = (String)it.next();
					System.out.println(ff);
					File fff = mm.getFile(ff);					
					idao.imgInsert(mm.getParameter("code"), fff.getName());
				}
				
				if(mm.getParameter("code")!= null) {
					idao = new PrdImgDAO();
					arr =  idao.prdImglist(mm.getParameter("code"));
				}



			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());

			// TODO: handle exception
		}
		
				
		if(request.getParameter("del") != null) {
			System.out.println("삭제");
			idao = new PrdImgDAO();
			new File(("C:\\hongkh\\study\\javaWork\\KRProj\\src\\main\\webapp\\prdImg\\"+request.getParameter("del"))).delete();
			System.out.println(request.getParameter("del"));
			idao.del(request.getParameter("del"));
			UpdateData = new PrdDAO().ListDetail(request.getParameter("code"));
			request.setAttribute("mainData", UpdateData);
			arr = idao.prdImglist(request.getParameter("code"));
			
		}
		
		
		
		System.out.println("서터레스"+arr);
		request.setAttribute("filedata", arr);
		request.setAttribute("UpdateData", UpdateData);

	}

}
