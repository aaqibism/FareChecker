package backend;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;



@WebServlet("/getLocation")

public class getLocation {
	private static final long serialVersionUID = 1L;
	public Vector<location> holder;	
	String usern;
	
    public getLocation(String usernam) {
    	this.holder=new Vector<location>();
    	
    	this.usern=usernam;
    	
    	
        // TODO Auto-generated constructor stub
    }

	public boolean getlocations() {
		// TODO Auto-generated method stub
		
		//String usern="hassib"; //(String)h.getAttribute("username");//must be done in login and register servlet*********
		Connection conn = null;
		PreparedStatement  st= null;
		ResultSet rs= null; 
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://google/FareChecker?cloudSqlInstance=farechecker-258720:us-west1:finalproject&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=hassib&password=rangeen");
			st= conn.prepareStatement("SELECT l.latitude, l.longitude, l.name FROM locations l, logins s WHERE s.username=? AND l.userID=s.userID");
			st.setString(1, usern);
			rs=st.executeQuery();
			if(rs.next())//set ending latitude
			{
				location temp=new location(rs.getString("name"),rs.getDouble("latitude"),rs.getDouble("longitude"));
				holder.add(temp);
				while(rs.next())
				{
					location t=new location(rs.getString("name"),rs.getDouble("latitude"),rs.getDouble("longitude"));
					holder.add(t);
				}
				

			}
			else
			{
				return false;
			}
			
			
			
			
			
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally
		 {
			 if(rs!=null)
			 {
				 try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 if(conn!=null)
			 {
				 try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 if(st!=null)
			 {
				 try {
					st.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 
		 }

		return true;


	}



}
