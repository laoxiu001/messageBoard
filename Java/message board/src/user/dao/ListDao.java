package user.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

import user.dao.BaseDao;
import user.util.TimeUtil;

public class ListDao {
	public List list =new ArrayList();//存储留言信息集合
	public int sum;//用于获取提取出来的数据库记录数
	/*
	 * 校长、部门、学院留言板等列表操作dao类
	 * */
	public void getList(String sql){
		/*
		 * 从数据库取出记录的内容
		 * */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = (Connection) BaseDao.getConn();
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			rs = (ResultSet) pstmt.executeQuery();
			while (rs.next()) {
				//先存入map集合
				Map map = new HashMap();
				map.put("id", rs.getString("id")); 
				map.put("type", rs.getString("type")); 
				map.put("title", rs.getString("title")); 
				map.put("m_content", rs.getString("m_content")); 
				//时间格式化
				TimeUtil tu= new TimeUtil();
				map.put("m_time", tu.formatTime(rs.getString("m_time"))); 
				map.put("m_time_s", tu.formatTime_s(rs.getString("m_time"))); 
				map.put("click", rs.getString("click")); 
				map.put("user", rs.getString("user")); 
				map.put("number", rs.getString("number")); 
				map.put("reply", rs.getString("reply")); 
				map.put("r_content", rs.getString("r_content")); 
				//时间格式化
				map.put("r_time", tu.formatTime(rs.getString("r_time"))); 
				map.put("r_time_s", tu.formatTime_s(rs.getString("r_time"))); 
				map.put("m_object2", rs.getString("m_object2")); 
				//将map放入list集合做全局调用
				list.add(map);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("getList异常");
			throw new RuntimeException(e);
		}finally{
			BaseDao.closeAll(conn, pstmt, rs);
		}
	}
	
	public void count(String sql){
		/*
		 * 用于计算从数据库中取出的具体记录数
		 * */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = (Connection) BaseDao.getConn();
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			rs = (ResultSet) pstmt.executeQuery();
			while (rs.next()) {
				this.sum += 1;//sum自增计数
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("count异常");
			throw new RuntimeException(e);
		}finally{
			BaseDao.closeAll(conn, pstmt, rs);
		}
	}
	
	public int getTotalPage(){
		/*
		 * 通过数据库中提取的记录数计算需要分页的总页数
		 * */
		int totalPage=1;//定义总页数初始值，防止数字异常
		if (sum<=14){
			//当记录数小于14条，总页数为1
			totalPage = 1;
		}else if(sum%14==0){
			//记录数为14倍数，总页数为相除所得
			totalPage = sum/14;
		}else if(sum%14!=0){
			//记录数不是14倍数，总页数为相除所得+1
			totalPage = sum/14 + 1;
		}
		return totalPage;
	}
	
}
