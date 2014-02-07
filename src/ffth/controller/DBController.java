package ffth.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * This is the controller among the database
 * @author Lee Zhuo Xun
 *
 */
public class DBController {
	private final String DB_USER_NAME = "admin";
	private final String DB_PASSWORD = "mysql";
	Connection con;
	
	/**
	 * This method is to get connection between data access and database
	 * @return Connection
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Connection getConnection() throws IllegalAccessException,InstantiationException, ClassNotFoundException, SQLException {
		// Instantiate a new instance of the driver
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url = "jdbc:mysql://127.0.0.1:3306/ffth_db";
		try { 
			//Establish connection between the database and JDBC
			con =  DriverManager.getConnection(url, DB_USER_NAME, DB_PASSWORD); 
			System.out.println("Successfully connected to " + url+ "."); 
		} 
		catch (java.sql.SQLException e) { 
			System.out.println("Connection failed ->"+ url); 
			System.out.println(e); 
		}
		return con; 
	}
}
