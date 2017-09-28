package admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class LoginDao {
	/*
	 * 这是管理员后台登陆功能的数据库操作类
	 */
	private boolean isSuccess = false;
	@SuppressWarnings("finally")
	/*
	 * 此处是旧版的JDBC代码
	 * 
	 * public boolean login(String user, String password) throws Exception {
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
	}*/
	
	/*
	 * Hibernate验证登录功能
	 * */
	public boolean login(String user, String password){
		// 获取Hibernate的配置对象
				Configuration configuration = new Configuration().configure();
				// 建立SessionFactory
				SessionFactory sessionFactory = configuration.buildSessionFactory();
				// 打开session
				Session session = sessionFactory.openSession();
				
				//创建Test对象并赋值
				User t = new User();
				
				//HQL语句
				String hql = "FROM User WHERE user = ? AND password = ?";
				//使用query接口  
				Query queryObject=session.createQuery(hql);
				
				//设置参数
				queryObject.setParameter(0, user);  
				queryObject.setParameter(1, password);  
				
				System.out.println("LoginDao中：");
				System.out.println("用户名" + user);
				System.out.println("密码" + password);
				
				List list = queryObject.list();
				if (list.size()>0) {
					System.out.println("验证用户是否存在的list集合大小为：" + list.size());
					isSuccess = true;
				}
				System.out.println(isSuccess);
				return isSuccess;
	}
}
