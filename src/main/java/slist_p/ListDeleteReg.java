package slist_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.PrdDAO;
import model_p.PrdDTO;

public class ListDeleteReg implements Service {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		
		int cnt =  new PrdDAO().ListDelete(request.getParameter("code")); 
		
		System.out.println("ListDeleteReg 실행 :"+cnt);
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", "삭제완료");
		request.setAttribute("goUrl", "SList?month=4");
		
		
		
		
	}

}
