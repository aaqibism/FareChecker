

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import user.DbUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = new PrintWriter(response.getWriter());
		String error = "";
		String next = "/login.jsp";
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username == null || username.contentEquals("")) {
			error += "Username cannot be empty.\n";
			
		}
		
		if (password == null || password.contentEquals("")) {
			error += "Password cannot be empty.\n";
		} 

		if (error.isEmpty()){
			DbUtils.initConnection();
			int valid = DbUtils.checkUserPassword(username, password);
			System.out.println(valid);
			if (valid == 0) {
				error += "Incorrect password.\n";
			} else if (valid == -1) {
				error += "This user does not exist.\n";
			} else {
				next = "/homepage.jsp";
				// set user cookie session
				Cookie ck = new Cookie("uname", username);
				response.addCookie(ck);
			}  
		}
		
		request.setAttribute("error", error);
		if (error.isEmpty()) {
			String redirect = request.getContextPath() + next;
			response.sendRedirect(redirect);
		} else {
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
			dispatch.forward(request,response);
		}
	}

}
