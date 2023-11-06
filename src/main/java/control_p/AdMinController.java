package control_p;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdMinController
 */
@WebServlet("/AdMin/*")
public class AdMinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdMinController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO: handle exception
		}

		
		String AdMinStr =  request.getRequestURI().substring(
				(request.getContextPath()+"/admin/").length()
				);
		
		System.out.println(AdMinStr);
		
		request.setAttribute("mainUrl", "main/admin/"+AdMinStr+".jsp");
				
		try {
			
			Service service = (Service)Class.forName("admin_p."+AdMinStr).newInstance();
			service.execute(request, response);
			
			
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admintemplate.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//response.getWriter().appe nd("Served at: ").append(sListStr);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
