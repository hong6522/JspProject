package admin_p;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;
import model_p.OrdersDAO;
import model_p.OrdersDTO;
import model_p.PrdDTO;
import model_p.adminData;
import model_p.qnaboardDAO;
import model_p.qnaboardDTO;

public class AdMinMain implements Service{
	public void execute(HttpServletRequest request,HttpServletResponse response ) {
		
		OrdersDAO dao = new OrdersDAO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		Date nextday = new Date();
		nextday.setMonth(today.getMonth()+1);
		
		
		sdf.format(today);
		ArrayList<OrdersDTO> res = dao.adminSales(sdf.format(today),sdf.format(nextday));
		adminData ad = new adminData();
		int tot = 0,priqq = 0,refundqq = 0,cancelqq = 0;
				
		for(OrdersDTO dto : res) {
			tot += dto.getTotpri();
		}
		
		qnaboardDAO qndao = new qnaboardDAO();
		ArrayList<qnaboardDTO> list = qndao.statelist("미답변");
		System.out.println("ttt");

		for(qnaboardDTO dto : list) {
			System.out.println(dto.getKind());
			
			if(dto.getKind().equals("상품")) {
				priqq++;
			}
			if(dto.getKind().equals("환불")) {
				refundqq++;
			}
			if(dto.getKind().equals("취소")) {
				cancelqq++;
			}
		}
		
		ArrayList<OrdersDTO> ready =  new OrdersDAO().deliveryReady();
		request.setAttribute("readyList", ready);
		
		ArrayList<OrdersDTO> cancel =  new OrdersDAO().deliveryCancel();
		request.setAttribute("cancelList", cancel);
		
		ArrayList<OrdersDTO> ffff =  new OrdersDAO().deliveryFinish();
		request.setAttribute("deliveryFinish", ffff);
		
		
		ArrayList<OrdersDTO> alllist =  new OrdersDAO().list();
		request.setAttribute("alist", alllist);
		
		

		ad.setOrderCnt(res.size());
		ad.setTotPrice(tot);
		ad.setPriqq(priqq);
		ad.setRefundqq(refundqq);
		ad.setCancelqq(cancelqq);


		ad.setToday(sdf.format(today));
		ad.setNextday(sdf.format(nextday));

		request.setAttribute("adminData", ad);

		
		
	}
}
