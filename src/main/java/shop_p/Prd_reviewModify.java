package shop_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control_p.Service;
import model_p.PData;
import model_p.ReviewDAO;
import model_p.ReviewDTO;

public class Prd_reviewModify implements Service{

	public void execute(HttpServletRequest request , HttpServletResponse response) {
		
		PData pd = (PData)request.getAttribute("pd");
		
		String path = request.getRealPath("/prdImg");
		path = "C:\\jyt\\javaWork\\KRProj\\src\\main\\webapp\\prdImg";
		
		ReviewDTO dto = new ReviewDTO();
		try {
			MultipartRequest mm = new MultipartRequest(
					request,
					path,
					10*1024*1024,
					"utf-8",
					new DefaultFileRenamePolicy());
			
			pd.setNowPage(Integer.parseInt(mm.getParameter("nowPage")));
			
			dto.setNum(Integer.parseInt(mm.getParameter("num")));
			dto.setGid(mm.getParameter("gid"));
			dto.setStar(Integer.parseInt(mm.getParameter("star")));
			dto.setContent(mm.getParameter("content"));
			dto.setNick(mm.getParameter("nick"));
			if(mm.getParameter("img")!=null&&!mm.getParameter("img").equals("notImg.jpg")) {
				dto.setImg(mm.getParameter("img"));
			} else {
				dto.setImg(mm.getFilesystemName("img"));
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		int cnt = new ReviewDAO().prd_modify(dto);
		
		String msg = "수정실패";
		String goUrl = "Prd_Detail?code="+dto.getGid()+"&nowPage="+pd.getNowPage();
		
		if(cnt==1) {
			
			msg = "수정을 완료 하였습니다.";
			goUrl = "Prd_Detail?code="+dto.getGid()+"&nowPage="+pd.getNowPage();
			
		}

		System.out.println("Prd_reviewModify.execute() 실행: "+cnt);
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		
	}
	
}
