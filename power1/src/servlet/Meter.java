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
 * Servlet implementation class Meter
 */
@WebServlet("/Meter")
public class Meter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection cn=GetDb.GetConnection();
			PrintWriter pw=response.getWriter();
			String cid=request.getParameter("cid");
			String unit=request.getParameter("unit");
			int pay=(int) (Integer.parseInt(unit)*6.75);
			String sql11="select cid from consumer where cid=?";
			PreparedStatement ps11=cn.prepareStatement(sql11);
			ps11.setString(1, cid);
			ResultSet rs11=ps11.executeQuery();
			if(rs11.next()){
			String sql="select payable from meter where cid=? and status=0";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1,cid);
			/*ps.setString(2, unit);
			ps.setString(3, request.getParameter("date"));
			ps.setInt(4, pay);
			ps.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("Meter.jsp");
			rd.include(request, response);
			pw.println("Entered..."); */
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				int p=rs.getInt(1);
				int fine = 0;
				if(p<500){
					fine=200;
				}else if(p>500 && p< 1000){
					fine=500;
				}else if(p>1000){
					fine=800;
				}
				int pay1=pay+p+fine;
				String sql1="update meter set status=1 where cid=? and status=0";
				PreparedStatement ps1=cn.prepareStatement(sql1);
				ps1.setString(1, cid);
				ps1.executeUpdate();
				String sql2="insert into meter values(?,?,?,?,?,0)";
				PreparedStatement ps2=cn.prepareStatement(sql2);
				ps2.setString(1, cid);
				ps2.setString(2, unit);
				ps2.setString(3, request.getParameter("date"));
				ps2.setInt(4, pay1);
				ps2.setInt(5, fine);
				ps2.execute();
				RequestDispatcher rd=request.getRequestDispatcher("Meter.jsp");
				rd.include(request, response);
				pw.println("Entered...");
			}else{
				String sql3="insert into meter values(?,?,?,?,0,0)";
				PreparedStatement ps3=cn.prepareStatement(sql3);
				ps3.setString(1, cid);
				ps3.setString(2, unit);
				ps3.setString(3, request.getParameter("date"));
				ps3.setInt(4, pay);
				ps3.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("Meter.jsp");
				rd.include(request, response);
				pw.println("Entered...");
			}
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("Meter.jsp");
			rd.include(request, response);
			pw.println("Wrong Consumer ID");
		}
	}catch(Exception e){
			System.out.println(e);
		}
	}

}
