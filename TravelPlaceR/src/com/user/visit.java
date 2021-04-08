package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbcon.ConnectionProvider;

/**
 * Servlet implementation class visit
 */
@WebServlet("/visit")
public class visit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public visit() {
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

		String name=request.getParameter("category");
		HttpSession session = request.getSession();
		
		try {
			Connection con = ConnectionProvider.getConn();
			DecimalFormat numberFormat= new DecimalFormat("#0.00000");
			PreparedStatement ps = con.prepareStatement("select * from marker_temp where name=?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				
				String lat = rs.getString("lat");
				String lon = rs.getString("lon");
				
				
				PreparedStatement ps1 = con.prepareStatement("select * from marker");
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next())
				{
					String marker_id=rs1.getString("id");
					String latitude=rs1.getString("lat");
					String longitude=rs1.getString("lon");
					String marker_name = rs1.getString("name");
					
					String temp1=numberFormat.format(Double.parseDouble(latitude)).toString();
					String temp2=numberFormat.format(Double.parseDouble(longitude)).toString();
					//System.out.println(temp1);
					//System.out.println(temp2);
					if(temp1.equals(lat) && temp2.equals(lon))
					{
						System.out.println("if");
						System.out.println(temp1);
						System.out.println(temp2);
						System.out.println("======== "+marker_id);
						System.out.println(marker_name);
						session.setAttribute("latitude",  latitude);
						session.setAttribute("longitude", longitude);
						session.setAttribute("marker_id", marker_id);
						session.setAttribute("marker_name", marker_name);
					}
					else
					{
						System.out.println("else");
						session.setAttribute("latitude",  lat);
						session.setAttribute("longitude", lon);
						session.setAttribute("marker_id", marker_id);
						session.setAttribute("marker_name", name);
					}
					
				}
			}
			response.sendRedirect("near1.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}

}
