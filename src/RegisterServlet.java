

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import user.DbUtils;

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

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String error = "";
		String next = "/register.jsp";
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		
		// error checking
		if (username == null || username.contentEquals("")) {
			error += "Username cannot be empty.\n";	
		}
		if (password == null || password.contentEquals("")) {
			error += "Password cannot be empty.\n";	
		}
		if (confirm == null || confirm.contentEquals("")) {
			error += "Must confirm password.\n";
		} 
		else if (!password.contentEquals(confirm)) {
			error += "Password must match confirmed password.\n";
		}
		
		// no error, add user
		if (error.isEmpty()) {
			DbUtils.initConnection();
			// check user exists
			int res = DbUtils.addUser(username, password);
			
			// user already exists
			if (res == 0) {
				error += "Username already exists.\n";
			} else {
				// set user is logged in
				next = "/homepage.jsp";
				// see if user is already logged in
				Cookie ck[] = request.getCookies();
				if (ck!=null) {
					String uname = ck[0].getValue();
					if (uname == null || !uname.equals("")) {
						// if already logged in, log out first
						ck[0].setMaxAge(0);
					}
				}
				// log new user in
				Cookie newCk = new Cookie("uname", username);
				response.addCookie(newCk);
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
