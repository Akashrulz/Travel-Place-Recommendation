package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbcon.ConnectionProvider;

import sun.awt.SunHints.LCDContrastKey;

/**
 * Servlet implementation class SearchTour
 */
@WebServlet("/SearchTour")
public class SearchTour extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchTour() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {

			HttpSession session = request.getSession();

			Connection con = ConnectionProvider.getConn();

			String source = request.getParameter("source");
			String destination = request.getParameter("destination");
			String category = request.getParameter("category");
			String visitorType = request.getParameter("visitorType");

			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");

			session.setAttribute("ipCategory",category);
			session.setAttribute("ipVisitorType", visitorType);
			String loc_category = "";
			String loc_season = "";
			String loc_type[];
			String loc_visitor[];

			// String noOfPeople = request.getParameter("noOfPeople");

			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			Date date = new Date();
			String Addeddate = dateFormat.format(date);

			if (source.equals(destination)) {
				response.sendRedirect("tour.jsp?samepoints");
			} else {

				PreparedStatement ps1 = con
						.prepareStatement("select * from location where city = '" + destination + "'");
				ResultSet rs1 = ps1.executeQuery();

				while (rs1.next()) {
					loc_category = rs1.getString("category");
					loc_season = rs1.getString("season");
				}

				System.out.println("added = " + Addeddate);

				System.out.println("locations category : " + loc_category + " and season : " + loc_season);

				String distance = "";
				String season = "all";

				int rate = 10;
				double journeyCost = 0;

				System.out.println("source " + source + " desti : " + destination);
				System.out.println("cat : " + category + " visitors : " + visitorType);
				System.out.println("to : " + toDate + " from : " + fromDate);
				if (source.equalsIgnoreCase(null) || destination.equalsIgnoreCase(null)) {

				} else {

					Test test = new Test();

					distance = test.getDistance(source, destination);

					journeyCost = Integer.parseInt(distance) * rate;

					System.out.println("cost  : " + journeyCost);

					int month = 0;
					String[] currentDate;

					int dateFlag = 0;
					if (toDate.length() != 0) {
						if (fromDate.length() != 0) {

							dateFlag = 1;
							currentDate = toDate.split("-");
							month = Integer.parseInt(currentDate[0]);
						}
					} else {

						dateFlag = 2;
						currentDate = Addeddate.split("/");
						month = Integer.parseInt(currentDate[1]);

					}
					if (month == 11 || month == 12 || month == 1 || month == 2) {
						season = "Winter";
					}
					if (month == 3 || month == 4 || month == 5 || month == 6) {
						season = "Summer";
					}
					if (month == 7 || month == 8 || month == 9 || month == 10) {
						season = "Rainy";
					}

					System.out.println("season ==== > " + season + " month : " + month);
				}

				// String src = dest
				PreparedStatement ps = null;
				ResultSet rs = null;
				if(category.length()==0){
					category = loc_category;
				}
				
				if (source.equalsIgnoreCase("select") || destination.equalsIgnoreCase("select")) {
					
					System.out.println("1");
					ps = con.prepareStatement("select * from location where season = '" + season +"'");

					rs = ps.executeQuery();
					
				} else {
					
					System.out.println("2");
					
					ps = con.prepareStatement("select * from location where season='" + loc_season +"'");
					rs = ps.executeQuery();

					
				}

				String dbLocaion = "";
				String locations[] = {};
				int loc =0;
				String resultId = "";
				while (rs.next()) {
					System.out.println();
					dbLocaion = rs.getString("location");
					String data = dbLocaion.replace(",", " ");
					// String check = dbLocaion;
					System.out.println("check " + dbLocaion);
					System.out.println("replacd " + data);
					String city = rs.getString("city");
					
					if (city.contains(destination)) {
						System.out.println("got : " + dbLocaion+ " "+rs.getString("id"));
						
						resultId = rs.getString("id");
						
						session.setAttribute("lcation_id", rs.getString("id"));
					}

					//locations[loc] = rs.getString("id");
					loc ++;					
				}
				System.out.println("locations : "+locations + " resultID "+resultId);

				System.out.println("distance : " + distance);

				session.setAttribute("cost", distance);
				response.sendRedirect("tour.jsp?resultid=" + resultId);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
