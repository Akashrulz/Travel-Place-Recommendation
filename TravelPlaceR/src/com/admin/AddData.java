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
 * Servlet implementation class AddData
 */
@WebServlet("/AddData")
public class AddData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddData() {
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

		try{
			
			String location = request.getParameter("location");
			String category = request.getParameter("category");
			String season = request.getParameter("season");
			String regDate = request.getParameter("regDate");
			
			System.out.println(location+" "+category+" "+season+" "+regDate);
	
			String[] Glocation = location.split(",");
			
			String abc = Glocation[0];
			
			System.out.println("abc : "+abc+ " "+Glocation);
			Connection con = ConnectionProvider.getConn();
			PreparedStatement ps = con.prepareStatement("select * from location where location = '"+location+"'");
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				response.sendRedirect("adddata.jsp?exist");
			}else{
				
				PreparedStatement ps1 = con.prepareStatement("insert into location (location,category,season,addedDate,city)"
						+ " value('"+location+"','"+category+"','"+season+"','"+regDate+"','"+abc+"')");
				int re = ps1.executeUpdate();
				
				if(re>0){
				response.sendRedirect("adddata.jsp?added");
				}else{
					response.sendRedirect("adddata.jsp?failed");	
				}
			}
			

			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
