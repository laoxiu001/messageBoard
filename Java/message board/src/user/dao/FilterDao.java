package user.dao;

import java.util.HashSet;
import java.util.Set;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

public class FilterDao {
	/*
	 * 这是敏感词过滤操作dao类
	 * */
	Set<String> set = null;//存储敏感词集合
	
	@SuppressWarnings("finally")
	public Set<String> getWord(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			set = new HashSet<String>();
			String sql="select * from t_filter";
			conn = (Connection) BaseDao.getConn();
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			rs = (ResultSet) pstmt.executeQuery();
			while (rs.next()) {
				set.add(rs.getString("word"));
			}
		}catch (Exception e) {
			System.out.println("getWord异常");
			throw new RuntimeException(e);
		}finally{
			BaseDao.closeAll(conn, pstmt, rs);
			return set;
		}
	}
}
