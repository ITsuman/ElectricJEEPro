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
 * Servlet implementation class ApproveRequest
 */
@WebServlet("/ApproveRequest")
public class ApproveRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection cn=GetDb.GetConnection();
			String sql="select acq from request where cid=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, request.getParameter("r"));
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
			if(rs.getString(1).equals("0")){
				String sql1="update request set rq=2,acq=0 where cid=?";
				PreparedStatement ps1=cn.prepareStatement(sql1);
				ps1.setString(1, request.getParameter("r"));
				ps1.execute();
				RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
				rd.include(request, response);
			}
			else if(rs.getString(1).equals("1")){
				String sql2="update request set rq=2,acq=2 where cid=?";
				PreparedStatement ps2=cn.prepareStatement(sql2);
				ps2.setString(1, request.getParameter("r"));
				ps2.execute();
				RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
				rd.include(request, response);
			}
		}
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
