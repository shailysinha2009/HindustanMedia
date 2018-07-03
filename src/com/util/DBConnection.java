package com.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBConnection {
	//static reference to itself
			private static DBConnection instance = new DBConnection();
			public static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
			public static final String USER = "kashaf";
			public static final String PASSWORD = "kashaf";
			public static final String DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver"; 
			
			//private constructor
			private DBConnection() {
				try {
					Class.forName(DRIVER_CLASS);
					System.out.println("working");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}
			
			private Connection createConnection() {
				Connection connection = null;
				try {
					connection = DriverManager.getConnection(URL, USER, PASSWORD);
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("ERROR: Unable to Connect to Database.");
				}
				return connection;
			}	
			
			public static Connection getConnection() {
				return instance.createConnection();
			}
}
