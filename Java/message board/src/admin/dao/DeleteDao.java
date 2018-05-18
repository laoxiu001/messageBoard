package admin.dao;

import java.sql.SQLException;

import user.dao.BaseDao;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class DeleteDao {
	public int del(int id) throws ClassNotFoundException, SQLException{
		String sql = "delete from t_message where id = ?";
		Connection conn=(Connection) BaseDao.getConn();//获取数据库连接
		PreparedStatement pstmt=(PreparedStatement) conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		int n = pstmt.executeUpdate();
		return n;//返回数据库更新状态
	}
}
