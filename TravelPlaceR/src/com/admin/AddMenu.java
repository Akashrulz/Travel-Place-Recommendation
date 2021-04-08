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
 * Servlet implementation class AddMenu
 */
@WebServlet("/AddMenu")
public class AddMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMenu() {
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


		try{
			String locationId = request.getParameter("locationId");
			String menuCategory = request.getParameter("menuCategory");
			String item = request.getParameter("item");
			String hotelName = request.getParameter("hotelName");
			
			Connection con = ConnectionProvider.getConn();
			PreparedStatement ps = con.prepareStatement("select * from hotel where location_id='"+locationId+"' and item_name = '"+item+"'");
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				response.sendRedirect("addHotel.jsp?menuExit");
			}else{
				
				PreparedStatement ps1 = con.prepareStatement("insert into hotel"
						+ "(location_id, menu_category, item_name, hotelName) values('"+locationId+"','"+menuCategory+"', '"+item+"','"+hotelName+"')");

				int rr = ps1.executeUpdate();
				
				if(rr>0){
					response.sendRedirect("addHotel.jsp?hotelAdded");
				}else{
					response.sendRedirect("addHotel.jsp?errorInAddHotel");
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
