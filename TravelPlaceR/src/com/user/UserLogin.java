package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
	try{
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();
		
		
		Connection con = ConnectionProvider.getConn();
		PreparedStatement ps =  con.prepareStatement("select * from user where email='"+username+"' and password='"+password+"'");
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()){
		
		String user = rs.getString("fname")+" "+rs.getString("lname");
		
		System.out.println("usre : "+user);
		session.setAttribute("user", user);
		session.setAttribute("username", username);
		response.sendRedirect("userhome.jsp?success");
		
		}else{
			response.sendRedirect("user.jsp?failed");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	}

}
