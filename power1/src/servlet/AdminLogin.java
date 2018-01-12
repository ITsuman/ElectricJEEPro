package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import module.GetDb;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection cn=GetDb.GetConnection();
			String sql="Select uid from admin where uid=? and pass=?";
			PrintWriter pw=response.getWriter();
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, request.getParameter("uid"));
			ps.setString(2, request.getParameter("pid"));
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				HttpSession ses=request.getSession();
				ses.setAttribute("uid", rs.getString(1));
				RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
				rd.include(request, response);
				
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("Admin.html");
				rd.include(request, response);
				pw.println("Wrong...");
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
