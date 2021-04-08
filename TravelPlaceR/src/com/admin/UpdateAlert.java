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
 * Servlet implementation class UpdateAlert
 */
@WebServlet("/UpdateAlert")
public class UpdateAlert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateAlert() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub

		try {

			String alert = request.getParameter("alert");
			String alertText = request.getParameter("alertText");
			String locationId = request.getParameter("locationId");
			System.out.println("alert : " +alert + " " + locationId);

			Connection con = ConnectionProvider.getConn();

			int flag = 0;

			if ("true".equalsIgnoreCase(alert)) {
				flag = 1;
			}

			PreparedStatement ps1 = con.prepareStatement("update location" + " set alert = '" + flag
					+ "', alert_message = '" + alertText + "' where id = '" + locationId + "'");
			int re = ps1.executeUpdate();

			if (re > 0) {
				response.sendRedirect("viewDb.jsp?alertUpdated");
			} else {
				response.sendRedirect("viewDb.jsp?alertFailed");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
