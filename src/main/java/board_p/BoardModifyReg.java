package board_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.BoardDAO;
import model_p.BoardDTO;
import model_p.PData;
import model_p.PDataBoard;

public class BoardModifyReg implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		PDataBoard pd = (PDataBoard)request.getAttribute("pd");
		String path = request.getRealPath("/prdimg");
		path = "C:\\jyt\\javaWork\\KRProj\\src\\main\\webapp\\prdImg";
		
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
			dto.setTitle(mm.getParameter("title"));
			dto.setGid(Integer.parseInt(mm.getParameter("gid")));
			dto.setPname(mm.getParameter("pname"));
			dto.setContent(mm.getParameter("content"));
			if(mm.getParameter("upfile")!=null) {
				dto.setUpfile(mm.getParameter("upfile"));
			}else {
				dto.setUpfile(mm.getFilesystemName("upfile"));
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("?? "+dto.getId()+","+dto.getGid());
		int cnt = new BoardDAO().modify(dto);	
		
		String goUrl = "BoardModifyForm?id="+dto.getId();
		String msg = "";
		
		if(cnt==1) {
			 msg = "수정완료";
			goUrl = "BoardDetail?id="+dto.getId()+"&nowPage="+pd.getNowPage();;
			
		}
		request.setAttribute("msg",msg);
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("goUrl", goUrl);
	}

}
