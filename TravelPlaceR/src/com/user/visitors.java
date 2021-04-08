package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class visitors
 */
@WebServlet("/visitors")
public class visitors extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String category;
	String speciality;
	String name;
	String latitude;
	String longitude;
	String userid;
	String marker_id;
    
	public visitors() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//near placess
		
		String type=request.getParameter("category");
		HttpSession session = request.getSession();
		session.setAttribute("type", type);
		response.sendRedirect("near.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
