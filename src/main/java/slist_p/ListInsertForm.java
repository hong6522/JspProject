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
import model_p.PrdDTO;


public class ListInsertForm implements Service {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		ArrayList<File> arr = (ArrayList<File>)session.getAttribute("fileData");
		
		if(session.getAttribute("fileData") == null) {
			arr = new ArrayList<>();
		}else {
			arr = (ArrayList<File>)session.getAttribute("fileData");
		}
		
		if(request.getParameter("del") != null) {
			
			arr.remove(new File("C:\\hongkh\\study\\javaWork\\KRProj\\src\\main\\webapp\\prdImg\\"+request.getParameter("del")));
			new File(("C:\\hongkh\\study\\javaWork\\KRProj\\src\\main\\webapp\\prdImg\\"+request.getParameter("del"))).delete();
			
		}


		
		for(File ff : arr) {
			
			System.out.println(ff);
		}
			
		
		
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
			System.out.println("mm.getFileNames()");

			
			  Iterator it = (Iterator) mm.getFileNames(); 

			System.out.println("it.hasNext()"+it.hasNext());

			int i = 0;
			
			
			while(it.hasNext()) {
				String ff = (String)it.next();
				System.out.println(ff);
				File fff = mm.getFile(ff);
				arr.add(fff);
				System.out.println("fff.getName()"+fff.getName()); 
				i++;
			}
			
					
			dto.setCode(mm.getParameter("code"));
			dto.setPrd_name(mm.getParameter("prd_name"));;
			dto.setSail_price(Integer.parseInt(mm.getParameter("sail")));
			dto.setReal_price(Integer.parseInt(mm.getParameter("real")));
			dto.setType(mm.getParameter("type"));
			dto.setReg_dateStr(mm.getParameter("reg_date"));
			dto.setImg(mm.getParameter("img"));
			dto.setDetailImg(mm.getParameter("detailImg"));
			dto.setContent(mm.getParameter("content"));
		
			
			
		} catch (Exception e) {
			System.out.println("e.getMessage()"+e.getMessage());
			
			// TODO: handle exception
		} finally {
			request.setAttribute("mainData", dto);
			session.setAttribute("fileData", arr);

		}
		
		
		
		
		
		
		
	}

}
