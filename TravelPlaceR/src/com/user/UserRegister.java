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

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
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
		//doGet(request, response);
		
		try{
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String dob = request.getParameter("dob");
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			String profession = request.getParameter("profession");
			String password = request.getParameter("password");
			
			Connection con = ConnectionProvider.getConn();
			PreparedStatement ps1 = con.prepareStatement("select * from user where email ='"+email+"' OR mobile= '"+mobile+"'");
			ResultSet rs1 = ps1.executeQuery();
			
			if(rs1.next()){
				response.sendRedirect("userregister.jsp?exist");
			}
			else{
			PreparedStatement ps = con.prepareStatement("insert into user(fname, lname, dob, gender, email, mobile, profession, password) "
					+ "values('"+fname+"','"+lname+"','"+dob+"','"+gender+"','"+email+"','"+mobile+"','"+profession+"','"+password+"')");

			int result = ps.executeUpdate();
			
			if(result>0){
				response.sendRedirect("user.jsp?success");
			}else{
				response.sendRedirect("userregister.jsp?failed");
			}}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
