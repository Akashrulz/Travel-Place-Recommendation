package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class UpdateData
 */
@WebServlet("/UpdateData")
public class UpdateData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateData() {
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
			String locationId = request.getParameter("locationId");
			System.out.println(location+" "+category+" "+season+" "+regDate);
			
			Connection con = ConnectionProvider.getConn();
	
				
				PreparedStatement ps1 = con.prepareStatement("update location"
						+ " set category = '"+category+"', season = '"+season+"' , addedDate= '"+regDate+"' where id = '"+locationId+"'");
						int re = ps1.executeUpdate();
				
				if(re>0){
				response.sendRedirect("viewDb.jsp?updated");
				}else{
					response.sendRedirect("viewDb.jsp?failed");	
				}
			

			
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}

}
