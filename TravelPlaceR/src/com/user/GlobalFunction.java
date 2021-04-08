package com.user;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.dbcon.ConnectionProvider;

//import org.apache.commons.codec.binary.Hex;




public class GlobalFunction {
    
    Connection con = ConnectionProvider.getConn();
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();            
    String Addeddate=dateFormat.format(date);
    
    Statement st = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;
    private boolean flag;
    
    public String getRole(int id) {
    	 String data = "";
    try{
       
        
        st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from role where id="+id);
        while(rs.next()){
            
            data = rs.getString("roleName");
        
        }
        
    }catch (Exception e) {
		e.printStackTrace();
	}
    return data;
    }
    
    public static void copyFile(File sourceFile, File destFile) throws IOException {
    	if (!sourceFile.exists()) {
    		return;
    	}
    	if (!destFile.exists()) {
    		destFile.createNewFile();
    	}
    	FileChannel source = null;
    	FileChannel destination = null;
    	source = new FileInputStream(sourceFile).getChannel();
    	destination = new FileOutputStream(destFile).getChannel();
    	if (destination != null && source != null) {
    		destination.transferFrom(source, 0, source.size());
    	}
    	if (source != null) {
    		source.close();
    	}
    	if (destination != null) {
    		destination.close();
    	}
    }
    
    
   public String getFullName(int userid) throws SQLException{
   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from user_info where id="+userid);
       if(rs.next()){
       data = rs.getString("fname")+" "+rs.getString("lname");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
 
   
  public int getLatestFileID() throws SQLException{
   
       int data=0;
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select id from userfile ORDER BY id DESC LIMIT 1");
       if(rs.next()){
       data = rs.getInt("id");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
  

  
  public String getLatestUserID() throws SQLException{
	   
      String data="";
      try{
      st = con.createStatement();
      ResultSet rs = st.executeQuery("select id from user ORDER BY id DESC LIMIT 1");
      if(rs.next()){
      data = rs.getString("id");
      }
  }catch (SQLException e) {
           System.out.println("Error:" + e);
       } finally {
           if (st != null) {
               st.close();
           }
           if (rs != null) {
               rs.close();
           }
       }
       return data;
      
  }
  public static void CreateDirectory(String FolderName)
  {	
	File file = new File("C:\\upload\\"+FolderName);
	if (!file.exists()) {
		if (file.mkdir()) {
			System.out.println("Directory is created!");
		} else {
			System.out.println("Failed to create directory!");
		}
	}
  }
   
      public String getUserEmail(int Userid) throws SQLException{
   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select email from user where id='"+Userid+"'");
       if(rs.next()){
       data = rs.getString("email");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
   
   public String getRoleName(int RoleID) throws SQLException{
   System.out.println("---------RoleID------"+RoleID);
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select roleName from role where id="+RoleID);
       if(rs.next()){
       data = rs.getString("roleName");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
      
   public String getUserRole(int Userid) throws SQLException{
   
       String data="";
       int UserRoleID=0;
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select UserRole from user where id="+Userid);
       if(rs.next()){
       UserRoleID = rs.getInt("UserRole");
       
       
       data = getRoleName(UserRoleID);
       }
       
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
   
    public int getUserRoleID(int Userid) throws SQLException{
   
       int data=0;
       int UserRoleID=0;
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select UserRole from user where id="+Userid);
       if(rs.next()){
       data = rs.getInt("UserRole");
       
       
       //data = getRoleName(UserRoleID);
       }
       
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
      
  
   public String getFileName(int Fileid) throws SQLException{
   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select fileName from userfile where id="+Fileid);
       if(rs.next()){
       data = rs.getString("fileName");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
      
   public String getFileExtention(File file){
   
       String name = file.getName();
       try{
       return name.substring(name.lastIndexOf(".") + 1);
       } catch(Exception e){
       return "";
       }
       
       
   }
   
   public boolean checkAdminLogin(String username,String password) throws SQLException{
   
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from admin where name='"+username+"' and password='"+password+"'");
       if(rs.next()){
       return true;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;       
   }
   
   public int checkAuthorised(int fileID,int UserRol) throws SQLException{
       int data=0;
       try{
       st = con.createStatement();
       String strss1 = Integer.valueOf(UserRol).toString();
       ResultSet rs = st.executeQuery("select * from userfile where id="+fileID);
       if(rs.next()){
           String[] Authorised = rs.getString("Authorised").split(",");
          for(int i=0;i<Authorised.length;i++){
            
              
              String strss = Authorised[i];
              if(strss.equalsIgnoreCase(strss1)){
              
                  data = Integer.parseInt(strss);
                  
               return data;
              }
              
             
              //if(data==UserRol){                  
                  
              
             // } 
              
          }         
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }


   public boolean VerifySecretCode(int id,String SecretCode) throws SQLException{
   
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from user where id="+id+" and SecretKey='"+SecretCode+"'");
       if(rs.next()){
       return true;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;       
   }
   
   public boolean VerifyFileSecretCode(int Fileid,String SecretCode) throws SQLException{
   
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from userfile where id="+Fileid+" and SecretKey='"+SecretCode+"'");
       if(rs.next()){
       return true;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;       
   }
   
   
   public void setEncryptionTime(int fid,float ExcutionTime) throws SQLException{
   
       try{
       st = con.createStatement();
       String sqlss = "INSERT INTO encryption(fileId,ExcutionTime) VALUE("+fid+","+ExcutionTime+")";
       System.out.println("enr========="+sqlss);
       st.executeUpdate(sqlss);
       
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        }
        
   }
   
   public void setDecryptionTime(int fid,float ExcutionTime) throws SQLException{
   
       try{
       st = con.createStatement();
       String sqlss = "INSERT INTO decryption(fileId,ExcutionTime) VALUE("+fid+","+ExcutionTime+")";
       System.out.println("enr========="+sqlss);
       st.executeUpdate(sqlss);
       
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        }
        
   }
   
   
   public String getSecretCode(int id) throws SQLException{
   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select SecretKey from user where id="+id);
       if(rs.next()){
           data = rs.getString("SecretKey");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }
   
   
   public int getFromUser(int Requestid) throws SQLException{
   
       int data=0;
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select fromUser from filerequest where id="+Requestid);
       if(rs.next()){
           data = rs.getInt("fromUser");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }
   
   public int getRequestStatus(int Requestid) throws SQLException{
   
       int data=0;
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select status from filerequest where id="+Requestid);
       if(rs.next()){
           data = rs.getInt("status");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }
   public String getRequestDate(int Requestid) throws SQLException{
   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select req_date from filerequest where id="+Requestid);
       if(rs.next()){
           data = rs.getString("req_date");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }
   
   public boolean checkClientWeatherID(String WatherID,int clientProvider) throws SQLException{
	   
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from client_weather_record where WeatherID='"+WatherID+"' and client_provider="+clientProvider);
       if(rs.next()){
       return true;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;       
   }
   
   public String getTrustedClientAthentication(int pro_id) throws SQLException{
	   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from clienttrustcertificate where id="+pro_id);
       if(rs.next()){
           data = rs.getString("trust");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   } 
   
public String getTrustedServerAthentication(int pro_id) throws SQLException{
	   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from trustcertificate where id="+pro_id);
       if(rs.next()){
           data = rs.getString("trust");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   } 


public String getReqfromId(int reqid) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from friend_request where id="+reqid);
    if(rs.next()){
        data = rs.getString("reqFrom");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 

public String getReqToId(int reqid) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from friend_request where id="+reqid);
    if(rs.next()){
        data = rs.getString("reqTo");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 


public int getRequestCount(int userid) throws SQLException{
	   
    int data=0;
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select count(id) from friend_request where reqTo="+userid+" and Status='0'");
    if(rs.next()){
        data = rs.getInt("count(id)");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 
public int getMessageCount(int userid) throws SQLException{
	   
    int data=0;
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select count(id) from message where msg_to="+userid+" and Status='0'");
    if(rs.next()){
        data = rs.getInt("count(id)");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 
   
public void updatenotification(int notiFrom,int notiTo,String Subject,String Status) throws SQLException{
	   
    try{
    st = con.createStatement();
    String sqlss = "INSERT INTO notification(notiFrom,notiTo,Subject,Status,notiDate) VALUE("+notiFrom+","+notiTo+",'"+Subject+"','"+Status+"','"+Addeddate+"')";
    //System.out.println("enr========="+sqlss);
    st.executeUpdate(sqlss);
    
}catch (SQLException e) {
         System.out.println("Error:" + e);
     }
     
}

public int getNotificationCount(int userid) throws SQLException{
	   
    int data=0;
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select count(id) from notification where notiTo="+userid+" and Status='Active'");
    if(rs.next()){
        data = rs.getInt("count(id)");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 

public void updateNotificationStatus(int notiTo) throws SQLException{
	   
    try{
    st = con.createStatement();
    String sqlss = "update  notification set Status='Deactive' where notiTo="+notiTo;
    
    st.executeUpdate(sqlss);
    
}catch (SQLException e) {
         System.out.println("Error:" + e);
     }
     
}

public String getUserFirstname(int userid) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from user_info where id="+userid);
    if(rs.next()){
        data = rs.getString("fname");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 


public boolean VerifyStudyingfield(int loggedInID,int Userid) throws SQLException{
	   
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from user_info where id="+loggedInID+" and studyingfields=(select studyingfields from user_info where id="+Userid+")");
    if(rs.next()){
    return true;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return false;       
}

public boolean checkStatusExists(int userid) throws SQLException{
	   
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from status where userid="+userid);
    if(rs.next()){
    return true;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return false;       
}

public String getStatusField(int userid,String category) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from status where userid="+userid+" and category='"+category+"'");
    if(rs.next()){
        data = rs.getString("poststatus");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
}


public String getstydyingField(int userid) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from user_info where id="+userid);
    if(rs.next()){
        data = rs.getString("studyingfields");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
}

public String getProfilePhotoName(int userid) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from user_info where id="+userid);
    if(rs.next()){
        data = rs.getString("ppicture");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
}


public boolean isFriend(int LoggedID,int FriendId) throws SQLException{
	   
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from friend_list where friend_of="+LoggedID+" and friend_id="+FriendId);
    if(rs.next()){
    return true;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return false;       
}


public boolean isRequestSend(int LoggedID,int FriendId) throws SQLException{
	   
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from friend_request where reqFrom="+LoggedID+" and reqTo="+FriendId);
    if(rs.next()){
    return true;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return false;       
}
public int getPostLikeCount(int postid) throws SQLException{
	   
    int data=0;
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from postliketbl where post_id="+postid+"");
    if(rs.next()){
        data = rs.getInt("plike");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 


public int getPostOwnerId(int postid) throws SQLException{
	   
    int data=0;
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from status where id="+postid+"");
    if(rs.next()){
        data = rs.getInt("userid");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 

public int getGroupCount(int userid) throws SQLException{
	   
    int data=0;
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select count(userid) from group_name where userid="+userid);
    if(rs.next()){
        data = rs.getInt("count(userid)");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
}

public void updateMemberCoount(int groupid) throws SQLException{
	String count = null;
    try{
    	PreparedStatement memcount=con.prepareStatement("select count(groupid) from group_member where groupid="+groupid);
    	ResultSet rs=memcount.executeQuery();
    	if(rs.next())
    	{
    		 count=rs.getString("count(groupid)");
    	}
    	
    st = con.createStatement();
    String sqlss = "update  group_name set membercount="+count+" where id="+groupid;
    
    st.executeUpdate(sqlss);
    
}catch (SQLException e) {
         System.out.println("Error:" + e);
     }
     
}



public void MaxidGroupEntry(int userid,String joindate)
{
	try {
		
		PreparedStatement ps=con.prepareStatement("SELECT MAX(id) as groupid FROM group_name");
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			String groupid=rs.getString("groupid");
			
			PreparedStatement ps1=con.prepareStatement("insert into group_member(groupid,memberid,joindate) values(?,?,?)");
			ps1.setString(1, groupid);
			ps1.setInt(2,userid);
			ps1.setString(3, joindate);
			
			ps1.executeUpdate();
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public String getGroupName(int groupid) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from group_name where id="+groupid);
    if(rs.next()){
        data = rs.getString("groupname");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
}

public boolean isGroupMember(int groupid,int Userid) throws SQLException{
	   
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from group_member where groupid="+groupid+" and memberid="+Userid);
    if(rs.next()){
    return true;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return false;       
}



public boolean isGroupAdmin(int groupid,int Memberid) throws SQLException{
	   
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from group_name where id="+groupid+" and userid="+Memberid);
    if(rs.next()){
    	
    return true;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return false;       
}

public void ChangeMessageStatus(String userid)
{
try 
{
	Connection con=ConnectionProvider.getConn();
	PreparedStatement ps=con.prepareStatement("update message set status='Deactivate' where msg_to="+userid);
	ps.executeUpdate();
	
} catch (Exception e) {
	e.printStackTrace();
}	
}


public void InsertAutoSeggestWords(String words)
{
	try 
	{
		PreparedStatement ps=con.prepareStatement("insert into speciality (special) values(?)");
		ps.setString(1, words);
		ps.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}


public void RemoveDuplicateRows(String tablename, String columnname)
{
	try {
		String sql="DELETE FROM "+tablename+" WHERE NOT EXISTS (SELECT * FROM (SELECT MIN(id) minID FROM "+tablename+" GROUP BY "+columnname+" HAVING COUNT(*) > 0 ) AS q WHERE minID=id)";
		//PreparedStatement ps=con.prepareStatement("DELETE FROM autoc WHERE NOT EXISTS (SELECT * FROM (SELECT MIN(id) minID FROM autoc GROUP BY suggestion HAVING COUNT(*) > 0 ) AS q WHERE minID=id)");
		PreparedStatement ps=con.prepareStatement(sql);
		int result=ps.executeUpdate();
		if(result>0)
		{
			//System.out.println("-----------Removed Duplicate Rows----------------");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}


public void InsertCategory(String category)
{
	try 
	{
		PreparedStatement ps=con.prepareStatement("insert into category (cat) values(?)");
		ps.setString(1, category);
		ps.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}
public void DeleteAllFiles(String tablename)
{
	try{
		
	String sql="delete from "+tablename;
	PreparedStatement ps=con.prepareStatement(sql);
	ps.executeUpdate();
	
	String sql1="ALTER TABLE "+tablename+" AUTO_INCREMENT = 1";
	PreparedStatement ps1=con.prepareStatement(sql1);
	ps1.executeUpdate();
	
	}catch (Exception e) {
		e.printStackTrace();
	}
}

}