 package user.dao;

import java.sql.PreparedStatement;






import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;

import user.entity.ListEntity;
import user.util.TimeUtil;
public class PublishDao {
	/*
	 * 用于发表留言的数据库操作dao类
	 * */
	public int id = 0;//获取发表后数据库更新返回最新id编号，用于用户后续根据id编号搜索留言
	public int publish(Connection conn,ListEntity listEntity)throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into t_message values(null,?,?,?,?,0,?,?,'系统自动回复','您的留言已经交由学校相关负责人进行处理，请耐心等待。。。',?,?,?)";
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, listEntity.getType());
			pstmt.setString(2, listEntity.getTitle());
			pstmt.setString(3, listEntity.getM_content());
			TimeUtil tu = new TimeUtil();
			pstmt.setString(4, tu.getTime());
			pstmt.setString(5, listEntity.getUser());
			pstmt.setString(6, listEntity.getNumber());
			pstmt.setString(7, tu.getTime());
			pstmt.setString(8, listEntity.getM_object1());
			pstmt.setString(9, listEntity.getM_object2());
			int n = pstmt.executeUpdate();//更新
			
			//获取当前更新记录的主键值
			rs = (ResultSet) pstmt.getGeneratedKeys();
            if(rs.next()){
            	//成功获取键值，赋值到id反馈给用户
                id = rs.getInt(1);
        	}
            return n;
		}catch(Exception e){
			System.out.println("publish异常");
			throw new RuntimeException(e);
		}finally {
			BaseDao.closeAll(conn, pstmt, rs);
		}
	}
}
