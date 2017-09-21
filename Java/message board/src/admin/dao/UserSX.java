package admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class UserSX {
	public static void main(String[] args) {
		bbb();
	}

	public static void bbb() {
		boolean isSuccess = false;
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
		queryObject.setParameter(1, "1");  
		queryObject.setParameter(2, "1");  
		
		
		List list = queryObject.list();
		if (list.size()>0) {
			System.out.println("验证用户是否存在的list集合大小为：" + list.size());
			isSuccess = true;
		}
		System.out.println(isSuccess);
	}
}
