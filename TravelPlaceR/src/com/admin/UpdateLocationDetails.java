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
 * Servlet implementation class UpdateLocationDetails
 */
@WebServlet("/UpdateLocationDetails")
public class UpdateLocationDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLocationDetails() {
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
			
			String locationId = request.getParameter("locationId");
			String visitorType = request.getParameter("visitorType");
			String locationType = request.getParameter("locationType");
			String placeName = request.getParameter("placeName");
			
			System.out.println(locationId+" "+visitorType+" "+locationType+" "+placeName);
			
			Connection con = ConnectionProvider.getConn();
			PreparedStatement ps = con.prepareStatement("select * from location_details where place_name = '"+placeName+"'");
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				response.sendRedirect("viewDb.jsp?exist");
			}else{
				
				PreparedStatement ps1 = con.prepareStatement("insert into location_details (location_id,location_type,"
						+ "visitor_type,place_name)"
						+ " value('"+locationId+"','"+locationType+"','"+visitorType+"','"+placeName+"')");
				int re = ps1.executeUpdate();
				
				if(re>0){
				response.sendRedirect("viewDb.jsp?added");
				}else{
					response.sendRedirect("viewDb.jsp?failed");	
				}
			}
			

			
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}

}
