package user.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {
/*
 * 这是数据库连接dao类，用于连接数据库
 * */
	static String driver = "com.mysql.jdbc.Driver";//驱动
	static String url = "jdbc:mysql://localhost:3306/sc?characterEncoding=utf-8";//数据库信息
	static String user = "sc";//数据库账号
	static String password = "sc";//数据库密码

	public static Connection getConn() throws ClassNotFoundException,SQLException {
		/*
		 * 获取数据库连接方法
		 * */
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeAll(Connection conn, PreparedStatement pstmt,
			/*
			 * 关闭数据库连接方法
			 * */
			ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}