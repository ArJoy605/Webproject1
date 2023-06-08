package lab.webtech;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class template
 */
@WebServlet("/template")
public class template extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = null;
		Connection con = null;
		PreparedStatement pst = null;
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(request.getParameter("radio").equals("student"))
		{
			session.setAttribute("role", "student");
		}else if (request.getParameter("radio").equals("teacher"))
		{
			session.setAttribute("role", "teacher");
		}
		else if(request.getParameter("radio").equals("admin")){
			session.setAttribute("role","admin");
		}
		else {
			dispatcher = request.getRequestDispatcher("index.jsp");
			request.setAttribute("status", "err");
			
		}
//		PrintWriter out = response.getWriter();
//		out.println(username +"-"+ password);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtech?useSSL=false","root","mynewpassword");
			if(session.getAttribute("role").equals("student")) {
				pst = con.prepareStatement("select * from students where username = ? and password = ?");
			}
			else if(session.getAttribute("role").equals("teacher")) {
				pst = con.prepareStatement("select * from teachers where username = ? and password = ?");
			}
			else  {
				pst = con.prepareStatement("select * from admins where username = ? and password = ?");
			}
			
			pst.setString(1, username);
			pst.setString(2, password);
			
			ResultSet res = pst.executeQuery();
//			System.out.println(res.getString("username"));
			if(res.next()) {
				session.setAttribute("name", res.getString("name"));
				session.setAttribute("email", res.getString("email"));
//				System.out.println(session.getAttribute("email"));
				if(session.getAttribute("role").equals("student")) {
					dispatcher = request.getRequestDispatcher("homeS.jsp");
				}
				else if(session.getAttribute("role").equals("teacher")) {
					dispatcher = request.getRequestDispatcher("homeT.jsp");
				}
				else {
					dispatcher = request.getRequestDispatcher("homeA.jsp");
				}
			}
			else {
				request.setAttribute("status", "failed");
				if(session.getAttribute("role").equals("student")) {
					dispatcher = request.getRequestDispatcher("index.jsp");
				}
				else if(session.getAttribute("role").equals("teacher")) {
					dispatcher = request.getRequestDispatcher("index.jsp");
				}
				else {
					dispatcher = request.getRequestDispatcher("index.jsp");
				}			}
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

