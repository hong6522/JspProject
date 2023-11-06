package board_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;

public class BoardDetail implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));  
		
		BoardDAO dao = new BoardDAO(); 
		dao.addCount(id); 
		BoardDTO mainData = dao.detail(id);	 
		System.out.println("BoardDetail.execute() 실행:"+mainData);

		request.setAttribute("mainData", mainData);  
	}

}
