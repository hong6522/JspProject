package admin_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.DateData;
import model_p.MembersDAO;
import model_p.stlDAO;
import model_p.stlDTO;

public class stlMng implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		DateData dd = new DateData();

		
		if(request.getParameter("date_type") != null) {
			
			dd = new DateData();
			dd.setType(request.getParameter("date_type"));
						
			ArrayList<stlDTO> res = null;
			int totPri = 0;
			
			if(request.getParameter("date_type").equals("1")) {
				
				stlDAO dao = new stlDAO();
				res = dao.stlList(request.getParameter("startDate"));
				request.setAttribute("mainData", res);
				dd.setStartDate(request.getParameter("startDate"));
			}
			
			if(request.getParameter("date_type").equals("2")) {
				
				stlDAO dao = new stlDAO();
				res = dao.stlList(request.getParameter("year"),request.getParameter("month"));
				request.setAttribute("mainData", res);
				dd.setYear(request.getParameter("year"));
				dd.setMonth(request.getParameter("month"));
			}
			
			for(stlDTO dto : res) {
				totPri += dto.getPrice();
			}
			
			request.setAttribute("totPri", totPri+"");
			request.setAttribute("DateData", dd);

			
			
		}
		

		
		
	}
	
}