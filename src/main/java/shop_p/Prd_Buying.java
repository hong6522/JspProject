package shop_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control_p.Service;
import model_p.MembersDAO;
import model_p.MembersDTO;
import model_p.OrdersDAO;
import model_p.OrdersDTO;
import model_p.PrdDAO;
import model_p.PrdDTO;
import model_p.SessionData;

public class Prd_Buying implements Service{

	public void execute(HttpServletRequest request , HttpServletResponse response) {

        HttpSession session = request.getSession();

        SessionData sd = (SessionData)session.getAttribute("SessionData");
        
        String cardNum = "";
        
        for (int i = 1; i <= 4; i++) {
			cardNum += request.getParameter("cardNum"+i)+"-";
		}
        
        cardNum = cardNum.substring(0, cardNum.length()-1);
        
        OrdersDTO dto = new OrdersDTO();
        
        String goUrl = "Prd_BuyReg?buyCnt="+request.getParameter("cnt")+"&nowPage="+request.getParameter("nowPage")+"&code="+request.getParameter("code");
        
        if(request.getParameter("cardMk")==null) {
        	
        	request.setAttribute("mainUrl", "inc/alert.jsp");
    		request.setAttribute("msg", "카드사를 선택해 주시길 바랍니다.");
    		request.setAttribute("goUrl", goUrl);
        	
        } else {
        
        dto.setId(sd.getId());
        dto.setClient(request.getParameter("client"));
        dto.setTotpri(Integer.parseInt(request.getParameter("totpri")));
        dto.setCode(request.getParameter("code"));
        dto.setCnt(Integer.parseInt(request.getParameter("cnt")));
        dto.setAddress(request.getParameter("address"));
        dto.setCardMk(request.getParameter("cardMk"));
        dto.setCardNum(cardNum);
        
         new OrdersDAO().orderNo_Find(dto);
        
        System.out.println("order_no: "+dto.getOrder_no());
        
        OrdersDTO MainData = new OrdersDAO().orderDetail(dto.getOrder_no());
        
        System.out.println("Prd_Buying.execute() 실행: "+dto.getCnt());
        
        request.setAttribute("MainData", MainData);
        
        }

    }
	
}
