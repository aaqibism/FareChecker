package backend;
//package backend;

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
 * Servlet implementation class remove
 */
@WebServlet("/remove")
public class remove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public remove() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = null;
		PreparedStatement  st= null;
		ResultSet rs= null;
		HttpSession ses= request.getSession();
		String name= request.getParameter("name");
		String userinfo= (String) ses.getAttribute("username");
		 try 
		 { 
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://google/FareChecker?cloudSqlInstance=farechecker-258720:us-west1:finalproject&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=hassib&password=rangeen");
			 	st= conn.prepareStatement("SELECT userID FROM logins WHERE username=?");
			 	st.setString(1, userinfo);
			 	rs=st.executeQuery();
			 	rs.next();
			 	int userid= rs.getInt("userID");
			 	st= conn.prepareStatement("DELETE FROM locations WHERE userID=? AND name=?");
				st.setInt(1, userid);
				st.setString(2, name);
				st.executeUpdate();	 
		 }
		 catch (SQLException | ClassNotFoundException sqle) 
		 {    
			
			 System.out.println(sqle.getMessage());
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
	}

	

}
