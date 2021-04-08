package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbcon.ConnectionProvider;
import com.user.GlobalFunction;


/**
 * Servlet implementation class demo
 */
@WebServlet("/demo")
public class demo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public demo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//System.out.println("hi");
		String myJsonData = request.getParameter("json");
		//System.out.println(myJsonData );
		String[] strformap=myJsonData.split("-,");
		HashMap<String, String> map = new HashMap<String, String>();
		for(int i=0;i<strformap.length;i++)
		{
			String str=strformap[i];
			//System.out.println(str);
			
			String name[] = str.split("/");
					
			//System.out.println(name[0]);
			//System.out.println(name[1]);
			
			if(i==(strformap.length-1))
			{
				//System.out.println("----------------------------------");
			}
			else{
				//System.out.println("--------================");
				map.put(name[0], name[1]);
			}
		}
		System.out.println(map);
		GlobalFunction GF = new GlobalFunction();
		GF.DeleteAllFiles("marker_temp");
		Set<String> keys = map.keySet();
		//System.out.println(keys);
		DecimalFormat numberFormat= new DecimalFormat("#0.00000");
		
		for(String key:keys)
		{
			String kk=key.toString();
					kk=kk.replace("?", "").replace("'", "").replace("-", "").toString();
			String value=map.get(key);
			
			String[] valarr = value.replace("(",")").replace(")", "").replace("-", "").split(",");
			System.out.println(kk);
			String lat=numberFormat.format(Double.parseDouble(valarr[0].trim())).toString();
			String lon=numberFormat.format(Double.parseDouble(valarr[1].trim())).toString();
			
			//System.out.println("Latitude== "+lat);
			//System.out.println("Longitude== "+lon);
			
			try {
				
				Connection con= ConnectionProvider.getConn();
				PreparedStatement pp = con.prepareStatement("insert into marker_temp(lat,lon,name) values(?,?,?)");
				pp.setString(1, lat);
				pp.setString(2, lon);
				pp.setString(3, kk);
				pp.executeUpdate();
				
				
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			
		}
		
	}

}
