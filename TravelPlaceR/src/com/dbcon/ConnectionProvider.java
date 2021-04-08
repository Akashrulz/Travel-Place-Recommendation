package com.dbcon;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectionProvider {
    private static Connection con=null;
     
    public static Connection getConn(){
        try{
            
        if(con==null){
         Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_test","root",""); 
        return con;
        }else{
           return con;  
        }
       
    }   catch(Exception e){
        e.printStackTrace();
    }
        return con;
    } 
    
       
}
