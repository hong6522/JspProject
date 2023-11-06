package slist_p;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

import control_p.Service;
import model_p.PrdDAO;
import model_p.PrdDTO;
import model_p.PrdImgDAO;
import model_p.PrdImgDTO;

public class SListDetail implements Service {

	public void execute(HttpServletRequest request , HttpServletResponse response) {
		
		PrdDTO SListDetailData = new PrdDAO().ListDetail(request.getParameter("code"));
		
		PrdImgDAO idao = new PrdImgDAO();
		ArrayList<PrdImgDTO> res = idao.prdImglist(request.getParameter("code"));


		
		
		request.setAttribute("SListDetailData", SListDetailData);
		request.setAttribute("filedata",res);

		
	}
	
	
	
	
}
