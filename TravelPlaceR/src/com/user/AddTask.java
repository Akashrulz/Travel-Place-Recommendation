package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

/**
 * Servlet implementation class AddTask
 */
@WebServlet("/UserAddTask")
public class AddTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTask() {
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
			String reminder = request.getParameter("reminder");
			String category = request.getParameter("catgory");
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			Date date = new Date();
			String Addeddate = dateFormat.format(date);
			
			HttpSession session  = request.getSession();
			String user = (String)session.getAttribute("username");
			
			Connection con = ConnectionProvider.getConn();
			
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `user_task`(`user`, `location`, `category`, `reminder_text`, `added_at`) "
					+ "VALUES ('"+user+"','"+location+"','"+category+"','"+reminder+"','"+Addeddate+"')");
			int re = ps1.executeUpdate();
			/*
			PreparedStatement ps = con.prepareStatement("insert into user_task (user, location, category, reminder_text, added_at)"
					+ " value('"+user+",'"+location+"','"+category+"','"+reminder+"','"+Addeddate+"')");
			int re = ps.executeUpdate();
			*/
			if(re>0){
				response.sendRedirect("userTask.jsp?taskAdd");
			}else{
				response.sendRedirect("userTask.jsp?taskFail");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
