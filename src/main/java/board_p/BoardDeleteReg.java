package board_p;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;
import model_p.PData;
import model_p.PDataBoard;

public class BoardDeleteReg implements Service {

	@Override
	public void  execute(HttpServletRequest request, HttpServletResponse response) {
		PDataBoard pd = (PDataBoard)request.getAttribute("pd");
		String path = request.getRealPath("/prdimg");
		path = "C:\\jyt\\javaWork\\KRProj\\src\\main\\webapp\\prdImg";

		BoardDTO dto = new BoardDTO();
		dto.setId(Integer.parseInt(request.getParameter("id")));
		dto.setGid(Integer.parseInt(request.getParameter("gid")));
		
		BoardDTO idPwChk = new BoardDAO().idPwChk(dto);
		
		int cnt = new BoardDAO().delete(dto);
		
		
		String goUrl = "BoardDetail?id="+dto.getId()+"&nowPage="+pd.getNowPage();
		String msg = "";
		
		if(cnt==1) {
			msg = "삭제완료";
			goUrl = "BoardList?&nowPage="+pd.getNowPage();
			if(!idPwChk.getUpfile().equals("")) {
				new File(path+"\\"+idPwChk.getUpfile()).delete();
			}
		}
		
		System.out.println("BoardDeleteReg 실행 =>" + cnt);
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);

				
	}

	
}
