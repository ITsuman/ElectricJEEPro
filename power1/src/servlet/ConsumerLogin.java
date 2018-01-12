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

import org.apache.catalina.ha.backend.Sender;

import module.GetDb;

/**
 * Servlet implementation class ConsumerLogin
 */
@WebServlet("/ConsumerLogin")
public class ConsumerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		Connection cn=GetDb.GetConnection();
		String sql="Select cid from consumer where email=? and password=?";
		PrintWriter pw=response.getWriter();
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, request.getParameter("uid"));
		ps.setString(2, request.getParameter("pid"));
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			HttpSession ses=request.getSession();
			ses.setAttribute("cid", rs.getString(1));
			RequestDispatcher rd=request.getRequestDispatcher("Consumer.jsp");
			rd.include(request, response);
			
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("Home.html");
			rd.include(request, response);
			pw.println("Wrong...");
		}
	}catch(Exception e){
		System.out.println(e);
	}

}
}