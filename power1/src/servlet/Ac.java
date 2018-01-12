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
 * Servlet implementation class Ac
 */
@WebServlet("/Ac")
public class Ac extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection cn=GetDb.GetConnection();
			PrintWriter pw=response.getWriter();
			String c=request.getParameter("cid");
			String sql="select cid from consumer where cid=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, request.getParameter("cid"));
			//ps.setString(2, request.getParameter("pid"));
			ResultSet rs=ps.executeQuery();
				if(rs.next()){
					String sql1="update request set acq=1 where cid=?";
					PreparedStatement ps1=cn.prepareStatement(sql1);
					ps1.setString(1, c);
					ps1.executeUpdate();
					RequestDispatcher rd=request.getRequestDispatcher("Ac.jsp");
					rd.include(request, response);
					pw.println("Successfully Applied for AC application...");
				}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("Ac.jsp");
				rd.include(request, response);
				pw.println("Wrong Credentials...");
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
