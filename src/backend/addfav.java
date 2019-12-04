package backend;

import java.io.IOException;
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
 * Servlet implementation class addfav
 */
@WebServlet("/addfav")
public class addfav extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public addfav() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		String name= request.getParameter("name");
		System.out.println("Lat: "+ lat+ " , lng: "+ lng+ " name: "+name);
		HttpSession h= request.getSession();
		String usern=(String) h.getAttribute("username");//this has to be set in login or register jsp
		System.out.println(lat + " " + lng + " " + name + " " + usern);
		
		 Connection conn = null;
		 PreparedStatement  st= null;
	 	 try {
	 		System.out.println("HERE: "+lat);
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://google/FareChecker?cloudSqlInstance=farechecker-258720:us-west1:finalproject&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=hassib&password=rangeen");
		 	st= conn.prepareStatement("INSERT INTO locations (userID, name, latitude, longitude) VALUES ((SELECT userID FROM logins WHERE username=?), ?, ?, ?)"); 
		 	st.setString(1, usern);
		 	st.setString(2, name);
		 	st.setDouble(3, lat);
		 	st.setDouble(4, lng);
		 	st.executeUpdate();

	 	 
	 	 } catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally
		 {
			
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

		
		
		
		
	}
	
}

