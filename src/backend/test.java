package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Gson gson = new Gson();
    public ArrayList<String> s;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public double degreesToRadians(double num)
	{
		
		  return ((num * Math.PI) / 180);

	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubreq
		
		s=new ArrayList<String>();
		String dist= request.getParameter("distance");
		System.out.println(dist);
		if(dist.contains(" mi"))
		{
			dist=dist.replace(" mi","");
		}
		while(dist.contains(","))
		{
			dist=dist.replace(",","");
		}
		while(dist.contains("\""))
		{
			dist=dist.replace("\"","");
		}
		
		if(!dist.contains("."))
		{
			dist+=".0";
		}
		System.out.println(dist);
		double miles= Double.parseDouble(dist);
		/*(double startlat= Double.parseDouble(request.getParameter("startinglat"));
		double enlatitude=  Double.parseDouble(request.getParameter("endinglat"));
			double startlng=  Double.parseDouble(request.getParameter("endinglng"));
			double endlng=  Double.parseDouble(request.getParameter("startinglng"));
		
		int  earthRadiusKm = 6371;

		 double  latitude = degreesToRadians(enlatitude-startlat);
		double   longitude = degreesToRadians(endlng-startlng);

		double  latRadians = degreesToRadians(startlat);
		double  latRadians2 = degreesToRadians(enlatitude);

		double   a = Math.sin(latitude/2) * Math.sin(latitude/2) +
		          Math.sin(longitude/2) * Math.sin(longitude/2) * Math.cos(latRadians) * Math.cos(latRadians2); 
		double   c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
		  double dist= earthRadiusKm *c;
		  double miles= dist/ 1.609;
		  System.out.println(dist);
		  System.out.println(miles);*/
		  if(miles<=3)
		  {
			  double lprice=4.0 + new Random().nextDouble() * (7.0 - 4.0);;
			  double uprice=4.0 + new Random().nextDouble() * (7.0 - 4.0);;
			  String lstring = String.format("%.2f", lprice);
			  String ustring = String.format("%.2f", uprice);
			  s.add(lstring);
			  s.add(ustring);
			  String userJsonString = this.gson.toJson(s);
			  PrintWriter out = response.getWriter();
		      response.setContentType("application/json");
		      response.setCharacterEncoding("UTF-8");
		      out.print(userJsonString);
		      out.flush();
		        
			  
			  
			  
		  }
		  else if(miles>3 && miles<=5)
		  {
			  double lprice=5.0 + new Random().nextDouble() * (10.0 - 5.0);;
			  double uprice=5.0 + new Random().nextDouble() * (10.0 - 5.0);;
			  String lstring = String.format("%.2f", lprice);
			  String ustring = String.format("%.2f", uprice);
			  s.add(lstring);
			  s.add(ustring);
			  String userJsonString = this.gson.toJson(s);
			  PrintWriter out = response.getWriter();
		      response.setContentType("application/json");
		      response.setCharacterEncoding("UTF-8");
		      out.print(userJsonString);
		      out.flush();
		        
			  
			  
			  
		  }
		  else if(miles>5 && miles<=10)
		  {
			  double lprice=9.0 + new Random().nextDouble() * (14.0 - 9.0);;
			  double uprice=9.0 + new Random().nextDouble() * (14.0 - 9.0);;
			  String lstring = String.format("%.2f", lprice);
			  String ustring = String.format("%.2f", uprice);
			  s.add(lstring);
			  s.add(ustring);
			  String userJsonString = this.gson.toJson(s);
			  PrintWriter out = response.getWriter();
		      response.setContentType("application/json");
		      response.setCharacterEncoding("UTF-8");
		      out.print(userJsonString);
		      out.flush();
		        
			  
			  
			  
		  }
		  else if(miles>10 && miles<=15)
		  {
			  double lprice=13.0 + new Random().nextDouble() * (18.0 - 13.0);;
			  double uprice=13.0 + new Random().nextDouble() * (18.0 - 13.0);;
			  String lstring = String.format("%.2f", lprice);
			  String ustring = String.format("%.2f", uprice);
			  s.add(lstring);
			  s.add(ustring);
			  String userJsonString = this.gson.toJson(s);
			  PrintWriter out = response.getWriter();
		      response.setContentType("application/json");
		      response.setCharacterEncoding("UTF-8");
		      out.print(userJsonString);
		      out.flush();
		        
			  
			  
			  
		  }
		  else if(miles>15 && miles<=20)
		  {
			  double lprice=17.0 + new Random().nextDouble() * (27.0 - 17.0);;
			  double uprice=17.0 + new Random().nextDouble() * (27.0 - 17.0);;
			  String lstring = String.format("%.2f", lprice);
			  String ustring = String.format("%.2f", uprice);
			  s.add(lstring);
			  s.add(ustring);
			  String userJsonString = this.gson.toJson(s);
			  PrintWriter out = response.getWriter();
		      response.setContentType("application/json");
		      response.setCharacterEncoding("UTF-8");
		      out.print(userJsonString);
		      out.flush();
		        
			  
			  
			  
		  }
		  
		  else if(miles>20 && miles<=30)
		  {
			  double lprice=25.0 + new Random().nextDouble() * (40.0 - 25.0);;
			  double uprice=25.0 + new Random().nextDouble() * (40.0 - 25.0);;
			  String lstring = String.format("%.2f", lprice);
			  String ustring = String.format("%.2f", uprice);
			  s.add(lstring);
			  s.add(ustring);
			  String userJsonString = this.gson.toJson(s);
			  PrintWriter out = response.getWriter();
		      response.setContentType("application/json");
		      response.setCharacterEncoding("UTF-8");
		      out.print(userJsonString);
		      out.flush();
		        
			  
			  
			  
		  }
		  else if(miles>30 && miles<=40)
		  {
			  double lprice=30.0 + new Random().nextDouble() * (50.0 - 30.0);;
			  double uprice=30.0 + new Random().nextDouble() * (50.0 - 30.0);;
			  String lstring = String.format("%.2f", lprice);
			  String ustring = String.format("%.2f", uprice);
			  s.add(lstring);
			  s.add(ustring);
			  String userJsonString = this.gson.toJson(s);
			  PrintWriter out = response.getWriter();
		      response.setContentType("application/json");
		      response.setCharacterEncoding("UTF-8");
		      out.print(userJsonString);
		      out.flush();
		        
			  
			  
			  
		  }
		  else 
		  {
			  double lprice=50.0 + new Random().nextDouble() * (100.0 - 50.0);;
			  double uprice=50.0 + new Random().nextDouble() * (100.0 - 50.0);;
			  String lstring = String.format("%.2f", lprice);
			  String ustring = String.format("%.2f", uprice);
			  s.add(lstring);
			  s.add(ustring);
			  String userJsonString = this.gson.toJson(s);
			  PrintWriter out = response.getWriter();
		      response.setContentType("application/json");
		      response.setCharacterEncoding("UTF-8");
		      out.print(userJsonString);
		      out.flush();
		        
			  
			  
			  
		  }
		
		
		
		
		
		
		
		
		
	}

}
