package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		try{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			Connection con = ConnectionProvider.getConn();
			
			PreparedStatement ps = con.prepareStatement("select * from admin where username='"+username+"' and password='"+password+"'");
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				response.sendRedirect("adminhome.jsp?success");
				
			}else{
				response.sendRedirect("admin.jsp?failed");
			}
			System.out.println("conn : "+con);
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
	}

}
