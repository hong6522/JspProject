package shop_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;
import model_p.PData;
import model_p.PrdDAO;
import model_p.PrdDTO;

public class Prd_saleList implements Service{

	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		PData pd = (PData)request.getAttribute("pd");
		
		PrdDAO dao = new PrdDAO();
		
		pd.setTotal(dao.total());
		
		ArrayList<PrdDTO> mainData = dao.prd_list(pd);
		System.out.println(mainData.size());
		
		System.out.println("Prd_saleList.execute() 실행: "+mainData);
		
		request.setAttribute("mainData", mainData);
		
	}
	
}
