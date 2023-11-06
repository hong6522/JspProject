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

public class stlMngdel implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {

		DateData dd = new DateData();
		dd.setType(request.getParameter("type"));
		if(dd.getType().equals("1")) {
			dd.setStartDate(request.getParameter("startDate"));
		}
		
		if(dd.getType().equals("2")) {
			dd.setYear(request.getParameter("year"));
			dd.setMonth(request.getParameter("month"));
		}

		stlDAO dao = new stlDAO();
		dao.delete(request.getParameter("no"));
		request.setAttribute("DateData", dd);
		
		
	}
	
}