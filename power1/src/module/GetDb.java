package module;
import java.sql.*;
public class GetDb {
	static Connection cn=null;
	static String driver="com.ibm.db2.jcc.DB2Driver";
	static String url="jdbc:db2://localhost:50000/Customer";
	static String user="Destiny";
	static String pass="techno6sk";
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
