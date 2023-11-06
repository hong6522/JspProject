package board_p;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;
import model_p.PData;
import model_p.PDataBoard;

public class BoardList implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		PDataBoard pd = (PDataBoard)request.getAttribute("pd");
		BoardDAO dao = new BoardDAO();
		pd.setTotal(dao.total());
		
		ArrayList<BoardDTO> mainData = dao.list(pd);		
		System.out.println("BoardList.execute() 실행:"+mainData);

		request.setAttribute("mainData", mainData);
	}

}
