package board_p;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;
import model_p.PData;
import model_p.PDataBoard;

public class FileDelete implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		PDataBoard pd = (PDataBoard)request.getAttribute("pd");
		
		String path = request.getRealPath("/prdImg");
		path = "C:\\hongkh\\study\\javaWork\\KRProj\\src\\main\\webapp\\prdImg";
		
		BoardDTO dto =new BoardDTO();
		try {
			MultipartRequest mm = new MultipartRequest(
					request, 
					path, 
					10*1024*1024,
					"utf-8", 
					new DefaultFileRenamePolicy());
			
			pd.setNowPage(Integer.parseInt(mm.getParameter("nowPage")));
			
			dto.setId(Integer.parseInt(mm.getParameter("id")));
			dto.setUpfile(mm.getParameter("upfile"));
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		int cnt = new BoardDAO().fileDelete(dto);
		System.out.println("FileDelete: "+cnt);
		
		String msg = "삭제 완료";
			
			new File(path +"\\" + dto.getUpfile()).delete();
			
			
		
	 
		System.out.println("FileDelete.execute() 실행:");
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", "BoardModifyForm?id="+dto.getId()+"&nowPage="+pd.getNowPage());
	}

}
