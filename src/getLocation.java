//package fareChecker;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class getLocation
 */
@WebServlet("/getLocation")
public class getLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getLocation() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
 		PrintWriter out = response.getWriter();
		Double startlat= Double.parseDouble(request.getParameter("startlat"));
		Double startlng= Double.parseDouble(request.getParameter("startlng"));
		String name= request.getParameter("name");
		HttpSession h= request.getSession();
		String usern="hassib"; //(String)h.getAttribute("username");//must be done in login and register servlet*********
		
		Connection conn = null;
		PreparedStatement  st= null;
		ResultSet rs= null; 
		try {
			conn = DriverManager.getConnection("jdbc:mysql://google/FareChecker?cloudSqlInstance=farechecker-258720:us-west1:finalproject&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=hassib&password=rangeen");
			st= conn.prepareStatement("SELECT l.latitude FROM locations l, logins s WHERE s.username=? AND l.userID=s.userID AND l.name=?");
			st.setString(1, usern);
			st.setString(2, name);
			rs=st.executeQuery();
			if(rs.next())//set ending latitude
			{
				Double lat= rs.getDouble("latitude");
				h.setAttribute("endinglat", lat);

			}
			else
			{
				out.write("Could not find location");
				
			}
			st= conn.prepareStatement("SELECT l.longitude FROM locations l, logins s WHERE s.username=? AND l.userID=s.userID AND l.name=?");
			st.setString(1, usern);
			st.setString(2, name);
			rs=st.executeQuery();
			if(rs.next())//set ending latitude
			{
				h.setAttribute("startinglat", startlat);
				h.setAttribute("startinglng", startlng);
				Double lng= rs.getDouble("longitude");
				h.setAttribute("endinglng", lng);

			}
			
			
			
		} catch (SQLException e) {
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
			 out.flush();
			 out.close();
		 }



	}



}
