package hibernate.utile;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import admin.dao.Message;
/**
 * hibernate工具类
 * @author 谭永超
 * @version v1.0
 * */
public class HibUtility {
	private boolean fleat = false;
	private Configuration cf = null;
	private Session session =null;
	private Transaction  Transaction =null;
	//获取Session 
	/**
	 * 创建工厂会话
	 * @return Session	工厂会话*/
	public Session getSession(){
		cf =new Configuration();
		cf.configure();
		@SuppressWarnings("deprecation")
		// 创建服务注册对象
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(cf.getProperties())
		.buildServiceRegistry();
		// 创建会话工厂对象
		SessionFactory sessionFactory = cf.buildSessionFactory(serviceRegistry);
		session = sessionFactory.openSession();
		//进行事务处理
		Transaction = session.beginTransaction();
		return session;
	}
	
	//获取指定条数的留言列表
	public List<Message> getSelect(int page){
		//hql语句
		String hql ="from Message message order by message.id";
		Query query =(Query) session.createQuery(hql);
		//实例list 存储结果集
		query.setFirstResult(page * 10);//设置起始行数，从0开始计数
		query.setMaxResults(10);//设置返回的行数
		List<Message> list = query.list();
        System.out.println("page=" + page);

		return list;
	}
	
	//获取指定id的留言内容
	public List<Message> getMessage(int id){
		//hql语句
		System.out.println("hql开始");
		String hql ="from Message message where id = :id order by message.id";
		System.out.println("hql结束");
		Query query =(Query) session.createQuery(hql);
		query.setInteger("id", id);
		//实例list 存储结果集
		List<Message> list = query.list();
		System.out.println("用户查询id = " + id);
		
		return list;
	}
	
	//统计记录总条数方法
	public int count(){
		//hql语句
		String hql ="from Message ";
		Query query =(Query) session.createQuery(hql);
		//实例list 存储结果集
		int count = 0;
		List<Message> list = query.list();
	    for (Message l : list) {
	    	System.out.println(l.getId());
	        count++;
		}
	    System.out.println("count=" + count);
		return count;
	}
	//delete操作
	/**
	 * 执行删除操作方法
	 * @param id	选择的记录id
	 * @return boolean */
	public boolean getDelete(int id){
		String hql ="delete Message where id = :id";
		Query qdelete = session.createQuery(hql);
		qdelete.setParameter("id",id);
		//执行
		int i = qdelete.executeUpdate();
		System.out.println(i);
		if(i!=0){
			fleat = true;
		}
		return fleat;
	}
	//update 操作
	/**
	 * 执行修改操作方法
	 * 用id选择记录修改name字段
	 * @param name 修改
	 * @param id 选择的记录
	 * @return boolean
	 * */
	public boolean getUpdate(String number,int id ){

		//第一种方法的修改
		/*
		//选取所要操作的列
		student =(Student) session.get(Student.class,"8103");
		//修改过后的值
		student.setNAME("谭永超");
		session.save(student);
		 */
		//第二种 ihql语句修改操作
		String hql ="update Student set NAME = :name where STUDENT_ID = :id";
		Query qupdate =session.createQuery(hql);
		qupdate.setParameter("name",number);
		qupdate.setParameter("id", id);
		//执行
		int i=qupdate.executeUpdate();
		System.out.println(i);
		if(i!=0){
			fleat = true;
		}
		return fleat;
	}
	//insert操作
	/**
	 * 执行增加记录操作方法
	 * @param name 添加NAME的值
	 * @param Class 添加CLASS的值
	 * @param age	添加AGE的值
	 * @return boolean
	 * */
	public boolean getInsrt(int id,String type,String title,String m_content,String m_time,String click,String user,String number,String reply,String r_content,String r_time,String m_object1,String m_object2){
		Message student = new Message();
		int i = (Integer) session.save(student);
		if(i!=0){
			fleat = true;
		}
		return fleat;
	}
	//释放资源
	/**
	 * 释放资源方法*/
	public void allclose(){
		//提交事务
		Transaction.commit();
		//关闭会话
		session.close();

	}
}
