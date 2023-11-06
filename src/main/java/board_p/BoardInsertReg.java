package board_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;

public class BoardInsertReg implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		String path = request.getRealPath("/prdImg");
		path = "C:\\jyt\\javaWork\\KRProj\\src\\main\\webapp\\prdImg";
		
		
		
		BoardDTO dto =new BoardDTO();
		try {
			MultipartRequest mm = new MultipartRequest(
					request, 
					path, 
					10*1024*1024,
					"utf-8", 
					new DefaultFileRenamePolicy());

			dto.setTitle(mm.getParameter("title"));
			dto.setPname(mm.getParameter("pname"));
			dto.setContent(mm.getParameter("content"));
			dto.setUpfile(mm.getFilesystemName("upfile"));
			//글쓴이 아이디
			dto.setRid(mm.getParameter("rid"));
			
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());

			// TODO: handle exception
		}
		
		int cnt = new BoardDAO().insert(dto);		
		System.out.println("BoardInsertReg.execute() 실행:"+cnt);
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", "작성하였습니다.");
		request.setAttribute("goUrl", "BoardList");
	}

}
