package board_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control_p.Service;

public class BoardDeleteForm implements Service {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("id", request.getParameter("id"));
		request.setAttribute("gid", request.getParameter("gid"));
	}

}
