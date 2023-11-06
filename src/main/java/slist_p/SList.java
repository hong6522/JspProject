package slist_p;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;
import model_p.PrdDAO;
import model_p.PrdDTO;

public class SList implements Service{
	
	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
	
		Calendar today = Calendar.getInstance();
		System.out.println(today.MONTH);

//		System.out.println(request.getParameter("month"));
		int	month ;
		if(request.getParameter("month") == null) {
			month = today.get(Calendar.MONTH)+1;
			
		}else {
			month = Integer.parseInt(request.getParameter("month"));

		}

		today.set(Calendar.MONTH,month-1);
		//today.set(Calendar.MONTH,month-1);

		
		
//		System.out.println(today.get(Calendar.MONTH));
		
		Locale loc = new Locale("en");
		SimpleDateFormat sdf = new SimpleDateFormat("MMM",loc);
		
		// System.out.println(sdf);
		String todayStr = (today.get(Calendar.MONTH)+1)+"월";
		String todayStrS = sdf.format(today.getTime());
		
//		System.out.println(todayStr);
//		System.out.println(todayStrS);
//		System.out.println(todayStrS);
		//String todayStr = today.get(Calendar.YEAR)+"년"+(month)+"월";


		
		ArrayList<PrdDTO> mainData =  new PrdDAO().salelist(month);
		
		System.out.println("SList.execute() 실행 :"+mainData);
		
		request.setAttribute("saleList", mainData);
		
		
		int last = today.getActualMaximum(Calendar.DATE);
		
		request.setAttribute("todayStr", todayStrS);
		request.setAttribute("last", last);
		
	}
	
}
