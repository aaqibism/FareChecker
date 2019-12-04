package backend;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		//Verify New Password Change.
		//New password cannot be old password and make the user confirm twice for the new password. 
		HttpSession h = request.getSession();
		String username=(String)h.getAttribute("username");
		String currUsername = request.getParameter("currUsername");
		String originalPassword = request.getParameter("originalPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		System.out.println(username + " " + currUsername + " " + originalPassword + " " + newPassword + " " + confirmPassword);

		Connection conn = null;
		PreparedStatement  st= null;
		ResultSet rs= null; 
		
		try {
			if (!username.equals(currUsername)) {
				System.out.println("Incorrect Username");
				request.setAttribute("error", "Incorrect Username or Password");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Settings.jsp");
				rd.forward(request, response);
			}
			if (newPassword == null || newPassword.isEmpty()) {
				System.out.println("New Password empty");
				request.setAttribute("error", "New Password cannot be empty");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Settings.jsp");
				rd.forward(request, response);
			}
			if (!newPassword.equals(confirmPassword)) {
				System.out.println("New and confirm Password Mismatch");
				request.setAttribute("error", "New Password and Confirmed Password Mismatch");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Settings.jsp");
				rd.forward(request, response);
			}
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://google/FareChecker?cloudSqlInstance=farechecker-258720:us-west1:finalproject&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=hassib&password=rangeen");
			st = conn.prepareStatement("SELECT * FROM logins WHERE username=? AND password=?");
			st.setString(1, username);
			st.setString(2, originalPassword);
			rs = st.executeQuery();
			if (rs.next()) {
				st = conn.prepareStatement("UPDATE logins SET password=? WHERE username=?");
				st.setString(1, newPassword);
				st.setString(2, username);
				boolean status = st.execute();
				if (status) {
					System.out.println("Success");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/profile.jsp");
					rd.forward(request, response);
				} else {
					System.out.println("Database error");
					request.setAttribute("error", "Error Updating Database");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/Settings.jsp");
					rd.forward(request, response);
				}
			}
			else {
				System.out.println("Incorrect Password");
				request.setAttribute("error", "Incorrect Username or Password");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Settings.jsp");
				rd.forward(request, response);
				//return;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} if (st != null) {
				try {
					st.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} 
		}
		
	}

}
