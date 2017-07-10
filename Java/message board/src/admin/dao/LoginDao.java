package admin.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.dao.BaseDao;

import com.mysql.jdbc.Connection;

public class LoginDao {
	/*
	 * 这是管理员后台登陆功能的数据库操作类
	 */
	private boolean isSuccess = false;
	@SuppressWarnings("finally")
	public boolean login(String user, String password) throws Exception {
		Connection conn = null;
		conn = (Connection) BaseDao.getConn();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from t_user where user=? and password=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();// 执行查询
			if (rs.next()) {
				isSuccess = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			BaseDao.closeAll(conn, pstmt, rs);
			return isSuccess;
		}
	}
}
