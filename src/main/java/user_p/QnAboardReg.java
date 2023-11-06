package user_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;
import model_p.SessionData;
import model_p.qnaboardDAO;
import model_p.qnaboardDTO;

public class QnAboardReg implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
	    HttpSession session = request.getSession();
		
		SessionData sd = (SessionData)session.getAttribute("SessionData");
		
		
		qnaboardDTO dto = new qnaboardDTO();
		dto.setId(sd.getId());
		dto.setKind(request.getParameter("kind"));
		dto.setContent(request.getParameter("content"));
		dto.setOrder_no(Integer.parseInt(request.getParameter("order_no")));


		
		qnaboardDAO dao = new qnaboardDAO();
		dao.insert(dto);
		
		
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", "작성하였습니다.");
		request.setAttribute("goUrl", "MyOrderList");
	}

}
