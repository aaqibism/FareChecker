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
 
		HttpSession h = request.getSession();
		PrintWriter out = response.getWriter();
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
				out.write("Incorrect Username or Password");
				out.flush();
				out.close();
				return;
			}
			if (newPassword == null || newPassword.isEmpty()) {
				System.out.println("New Password empty");
				out.write("New Password cannot be empty");
				out.flush();
				out.close();
				return;
			}
			if (!newPassword.equals(confirmPassword)) {
				System.out.println("New and confirm Password Mismatch");
				out.write("New Password and Confirmed Password Mismatch");
				out.flush();
				out.close();
				return;
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
				out.write("");
			}
			else {
				System.out.println("Incorrect Password");
				out.write("Incorrect Username or Password");
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
			out.flush();
			out.close();
		}
		
	}

}
