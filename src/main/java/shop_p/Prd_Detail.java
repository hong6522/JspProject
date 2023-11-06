package shop_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;
import model_p.PData;
import model_p.PrdDAO;
import model_p.PrdDTO;
import model_p.ReviewDAO;
import model_p.ReviewDTO;

public class Prd_Detail implements Service{

	public void execute(HttpServletRequest request , HttpServletResponse reponse) {
		
		String code = request.getParameter("code");
		
		PrdDTO mainData = new PrdDAO().ListDetail(code);
		
		PData pd = (PData)request.getAttribute("pd");
		
		ReviewDAO dao = new ReviewDAO();
		
		pd.setTotal(dao.total());
		
		ArrayList<ReviewDTO> reviewData = dao.review_list(pd);
		
		System.out.println("Prd_Detail.execute() 실행: "+mainData);
		System.out.println("reviewData() 실행: "+reviewData);
		
		request.setAttribute("mainData", mainData);
		request.setAttribute("reviewData", reviewData);
				
	}
	
}
