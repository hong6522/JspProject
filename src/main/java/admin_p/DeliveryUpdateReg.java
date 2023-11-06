package admin_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.OrdersDAO;
import model_p.OrdersDTO;


public class DeliveryUpdateReg implements Service {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		OrdersDTO dto = new OrdersDTO();
		
			dto.setOrder_no(Integer.parseInt(request.getParameter("no")));
			dto.setDlvryStts(request.getParameter("dlvrystts"));
			dto.setOrderStts(request.getParameter("orderstts"));
			dto.setReg_dateStr(request.getParameter("reg"));
			
		int cnt =  new OrdersDAO().ordersUpdate(dto); 
		
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", "수정하였습니다.");
		request.setAttribute("goUrl", "Delivery?reg="+request.getParameter("reg")+"&dlvrystts="+request.getParameter("dlvrystts"));
	}
}