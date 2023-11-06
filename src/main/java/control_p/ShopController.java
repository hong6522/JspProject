package control_p;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model_p.PData;

/**
 * Servlet implementation class ShopController
 */
@WebServlet("/Shop/*")
public class ShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HttpSession session;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopController() {
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

		new PData(request);
		
		session = request.getSession();
		
		String ShopStr =  request.getRequestURI().substring(
				(request.getContextPath()+"/Shop/").length()
				);
		
		
		
		request.setAttribute("mainUrl", "main/shop/"+ShopStr+".jsp");
				
		try {
			
			Service service = (Service)Class.forName("shop_p."+ShopStr).newInstance();
			service.execute(request, response);
			
			
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/template.jsp");
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
