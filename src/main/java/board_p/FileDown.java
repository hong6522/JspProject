package board_p;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;

public class FileDown implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String fName = request.getParameter("fName");
		String path = request.getRealPath("prdImg")+"\\";
		path = "C:\\hongkh\\study\\javaWork\\KRProj\\src\\main\\webapp\\prdImg";
		
		response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fName));
		
		try {
			ServletOutputStream sos = response.getOutputStream();
			FileInputStream fis = new FileInputStream(path+fName);
			
			byte [] buf = new byte[1024];
			while(fis.available()>0) {
				int len = fis.read(buf);
				sos.write(buf, 0, len);
			}
			
			fis.close();
			sos.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}

}
