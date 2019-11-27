

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class Settings
 */
@WebServlet("/Settings")
public class Settings extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String CREDENTIALS_STRING = "jdbc:mysql://google/homework3?cloudSqlInstance=homework3-257818:us-west1:homework3&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=test&password=password";
	static Connection connection = null;   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Settings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Statement st = null;
		ResultSet rs = null;
		
		//Check if the user is logged in. Only allow access to settings if there is 
		//a user logged in.
		String errorMessage = "";
		HttpSession session = request.getSession();
		if(session.getAttribute("name") == null) {
			errorMessage+= "You must be logged in to change your settings.";
			//Send them back to whatever page.
			//TODO: What page should we send the user back if they are not logged in?
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/HomePage.jsp");
			try {
				rd.forward(request, response);
			}
			catch(IOException e) {
				e.printStackTrace();
			}
			catch(ServletException e) {
				e.printStackTrace();
			}
			return;
		}
		
		//Verify New Password Change.
		//New password cannot be old password and make the user confirm twice for the new password. 
		
		String successMessage = "";
		String originalPassword = request.getParameter("orinigalPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		if (!newPassword.contentEquals(confirmPassword)) {
			errorMessage+="New password does not match.";
		}
		else if(originalPassword.contentEquals(confirmPassword)) {
			errorMessage+="Please select a new password.";
		}
		else {
			successMessage+="Success! Your password has been changed.";
		}
		//Update the new password in database
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(CREDENTIALS_STRING);
			st = connection.createStatement();
			st.executeUpdate("Update users SET password ='"	+ confirmPassword + "'" + "WHERE username='" + session.getAttribute("name") + "'");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		
		
		
	}

}
