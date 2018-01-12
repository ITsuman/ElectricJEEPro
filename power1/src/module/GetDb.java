package module;
import java.sql.*;
public class GetDb {
	static Connection cn=null;
	static String driver="com.ibm.db2.jcc.DB2Driver";//DB2 database used 
	static String url="";//Database URL
	static String user="";//Username
	static String pass="";//Password
	public static Connection GetConnection(){	
		try{
		Class.forName(driver);
		cn=DriverManager.getConnection(url,user,pass);
	}catch(Exception e){
		System.out.println(e);
		}
		return cn;
	}
}
