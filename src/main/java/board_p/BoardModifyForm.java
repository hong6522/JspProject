package board_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;

public class BoardModifyForm implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id 임 "+id);
		
		BoardDAO dao = new BoardDAO();
		BoardDTO mainData = dao.detail(id);		
		System.out.println("BoardModifyForm.execute() 실행:"+mainData);

		request.setAttribute("mainData", mainData);
	}

}
