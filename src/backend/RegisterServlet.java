package backend;


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
//import user.DbUtils;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	 {
		PrintWriter out = response.getWriter();
		HttpSession h= request.getSession();
		
   	 	Connection conn = null;
   	 	PreparedStatement  st= null;
   	 	ResultSet rs= null; 
   	 	try {    
			String username= request.getParameter("username");
			String password= request.getParameter("password1");
			String confirm= request.getParameter("password2");
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://google/FareChecker?cloudSqlInstance=farechecker-258720:us-west1:finalproject&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=hassib&password=rangeen");
			st= conn.prepareStatement("SELECT * FROM logins WHERE username=?");
			st.setString(1, username);
			rs= st.executeQuery();
			if(rs.next())//if user name is not unique
			{
				
				out.write("This username is already taken");
				System.out.println("Username taken");
				
			}
			else//check if passwords are same
			{
				if(!(password.equals(confirm)))//if passwords don't match
				{
					
					out.write("The passwords do not match");
					System.out.println("Passwords don't match");
	
				}
				else if (password == null || password.isEmpty()) {
					out.write("Password cannot be empty");
					System.out.println("Empty Password");
				}
				else//sucessful register so insert into database
				{
					st= conn.prepareStatement("INSERT INTO logins (username, password) VALUES (?,?)");
					st.setString(1, username);
					st.setString(2, password);
					//helpful when keeping track of who is logged in 
					h.setAttribute("username", username);					
					st.executeUpdate();
					out.write("");
					System.out.println("Success");
				}
	
			}
	
		 }
		 catch (SQLException | ClassNotFoundException sqle)  {    
			 System.out.println(sqle.getMessage());
		 }
		 finally {
			 
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
