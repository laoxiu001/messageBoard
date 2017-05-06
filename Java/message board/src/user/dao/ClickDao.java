package user.dao;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ClickDao {
	/*
	 * 点击率增加数据库操作类
	 * */
	public int addClick(int id)throws Exception{
			String sql = "update t_message set click=click+1 where id = "+id+"";
			Connection conn=(Connection) BaseDao.getConn();//获取数据库连接
			PreparedStatement pstmt=(PreparedStatement) conn.prepareStatement(sql);
			return pstmt.executeUpdate();//返回数据库更新状态
	}
}
