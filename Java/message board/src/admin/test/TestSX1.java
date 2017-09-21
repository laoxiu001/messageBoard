package admin.test;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class TestSX1 {
	public static void main(String[] args) {
		bbb();
	}

	public static void bbb() {
		// 获取Hibernate的配置对象
		Configuration configuration = new Configuration().configure();
		// 建立SessionFactory
		SessionFactory sessionFactory = configuration.buildSessionFactory();
		// 打开session
		Session session = sessionFactory.openSession();
		
		//创建Test对象并赋值
		Test t = new Test();
		t.setName("呵呵呵");
		
		//HQL语句
		String sql = "select * from test";  
        SQLQuery sqlQuery = session.createSQLQuery(sql).addEntity(Test.class);
        
        List<Test> list =sqlQuery.list();//java.util包  
        for(Test te : list){  
            System.out.println(te.getId());  
        }  
	}
}
