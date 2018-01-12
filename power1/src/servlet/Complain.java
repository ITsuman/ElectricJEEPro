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

import module.GetDb;

/**
 * Servlet implementation class Complain
 */
@WebServlet("/Complain")
public class Complain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection cn=GetDb.GetConnection();
			String cm="cm"+(int)(Math.random()*1000);
			String sql="insert into Complain values(?,?,?,?,?,?,?)";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, request.getParameter("name"));
			ps.setString(2, request.getParameter("email"));
			ps.setString(3, request.getParameter("phn"));
			ps.setString(4, request.getParameter("msg"));
			ps.setString(5, request.getParameter("cid"));
			ps.setString(6, request.getParameter("sub"));
			ps.setString(7, cm);
			ps.execute();
			RequestDispatcher rd=request.getRequestDispatcher("Complain.jsp");
			rd.include(request, response);
			PrintWriter pw=response.getWriter();
			pw.println("Comlain made...Complain Id is "+cm);
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
