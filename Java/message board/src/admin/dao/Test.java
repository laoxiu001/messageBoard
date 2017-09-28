package admin.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class Test {
	public static void main(String[] args) {
		// 获取Hibernate的配置对象
		Configuration configuration = new Configuration().configure();
		// 建立SessionFactory
		SessionFactory sessionFactory = configuration.buildSessionFactory();
		// 打开session
		Session session = sessionFactory.openSession();
		
		//创建Test对象并赋值
		Message m = new Message();
		
		//HQL语句
		String sql = "select * from Message";  
        SQLQuery sqlQuery = session.createSQLQuery(sql).addEntity(Message.class);
        
        List<Message> list =sqlQuery.list();//java.util包  
        for(Message m1 : list){  
            System.out.println(m1.getId());  
        }  
	}
}
