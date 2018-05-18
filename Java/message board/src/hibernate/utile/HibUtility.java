package hibernate.utile;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import admin.dao.Message;
import admin.dao.User;
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
	private int consulting = 1;
	private int suggest = 1;
	private int complaints = 1;

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
		String hql ="from Message message where message.m_object2 = '数学与财经学院' order by message.id";
		Query query =(Query) session.createQuery(hql);
		//实例list 存储结果集
		query.setFirstResult(page * 10);//设置起始行数，从0开始计数
		query.setMaxResults(10);//设置返回的行数
		List<Message> list = query.list();

		return list;
	}

	//获取指定id的留言内容
	public List<Message> getMessage(int id){
		//hql语句
		String hql ="from Message message where id = :id order by message.id";
		Query query =(Query) session.createQuery(hql);
		query.setInteger("id", id);
		//实例list 存储结果集
		List<Message> list = query.list();

		return list;
	}
	//查询用户名是否重复
		public boolean inf_p(String user,String id_1){
			//hql语句
			boolean b = true;
			int id = Integer.parseInt(id_1);
			String hql ="from User where user = :user ";
			Query query =(Query) session.createQuery(hql);
			//实例list 存储结果集
			query.setParameter("user",user);
			List<User> list = query.list();
			for(User l : list){
				if(l.getId()== id){
					b =true;
				}else{
					b = false;
				}
			}
			return b ;
		}
	//个人信息查询
	public List<User> inf(String id_1){
		//hql语句
		int id = Integer.parseInt(id_1);
		String hql ="from User where id = :id ";
		Query query =(Query) session.createQuery(hql);
		//实例list 存储结果集
		query.setParameter("id",id);
		List<User> list = query.list();
		return list ;
	}
	//修改个人资料
	public boolean inf_u(String user,String department,String tel,String email,int id){
		boolean b = false;
		String hql ="update User set user = :user, department = :department , "
				+ "tel = :tel,email = :email where id = :id ";
		Query qupdete = session.createQuery(hql);
		qupdete.setParameter("user", user);
		qupdete.setParameter("department", department);
		qupdete.setParameter("tel", tel);
		qupdete.setParameter("email", email);
		qupdete.setParameter("id", id);
		int i =qupdete.executeUpdate();
		if(i!=0){
			b = true;
		}
		return b;
	}
	//统计记录总条数方法
	public int count(){
		//hql语句
		String hql ="from Message where m_object2 = '数学与财经学院'";
		Query query =(Query) session.createQuery(hql);
		//实例list 存储结果集
		int count = 0;
		List<Message> list = query.list();
		for (Message l : list) {
			count++;
		}
		return count;
	}

	//查询密码是否正确
	public int getSelect_User(String password,String id_1){
		//hql语句
		String hql ="from User where id = :id and password = :password";
		Query query =(Query) session.createQuery(hql);
		//实例list 存储结果集
		int count = 0;
		int id = Integer.parseInt(id_1);
		query.setParameter("id", id);
		query.setParameter("password", password);
		List<User> list = query.list();
		for(User l : list){
			count = 1;
		}
		return count;
	}

	//判断已读条数和未读条数
	public int number(){
		String hql ="from Message";
		Query query =(Query) session.createQuery(hql);
		int i = 0 ;//已回复条数
		int j = 0 ;//未回复条数
		int a = 0;
		int b = 0;
		int c = 0;
		List<Message> list = query.list();
		//向需要的数据赋值
		for (Message m : list) {
			if(m.getStatus()== 1){
				i++;
			}else{
				j++;
			}
			if(m.getType().toString().equals("咨询")){
				a++;
			}else if(m.getType().toString().equals("建议")){
				b++;
			}else if(m.getType().toString().equals("投诉")){
				c++;
			}
		}
		consulting = a;
		suggest = b;
		complaints = c;
		return i;
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
		if(i!=0){
			fleat = true;
		}
		return fleat;
	}
	public int getConsulting() {
		return consulting;
	}

	public void setConsulting(int consulting) {
		this.consulting = consulting;
	}

	public int getSuggest() {
		return suggest;
	}

	public void setSuggest(int suggest) {
		this.suggest = suggest;
	}

	public int getComplaints() {
		return complaints;
	}

	public void setComplaints(int complaints) {
		this.complaints = complaints;
	}

	/**
	 * update 操作
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
		if(i!=0){
			fleat = true;
		}
		return fleat;
	}

	//修改用户密码
	public boolean getUpdate(String user, String password){

		//第一种方法的修改
		/*
			//选取所要操作的列
			student =(Student) session.get(Student.class,"8103");
			//修改过后的值
			student.setNAME("谭永超");
			session.save(student);
		 */
		//第二种 ihql语句修改操作
		String hql ="update User set password = :password  where user = :user";
		Query qupdate =session.createQuery(hql); 
		qupdate.setParameter("user", user);
		qupdate.setParameter("password", password);
		//执行
		int i=qupdate.executeUpdate();
		if(i!=0){
			fleat = true;
		}
		return fleat;
	}


	//回复留言
	public boolean getUpdate(int id, String reply, String r_content, String m_object){

		//字符串分割
		String [] m_object_s=m_object.split(",");//将获取的留言对象从“，”分割

		//格式化创建当前回复时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String r_time = sdf.format(new Date());

		//创建hql语句
		Query qupdate = null;
		String hql;
		if(!m_object.equals("false,false") && m_object!=null){
			hql ="update Message set reply = :reply, r_content = :r_content, m_object1 = :m_object1, m_object2 = :m_object2, r_time = :r_time where id = :id";

			//给各字段赋值
			qupdate =session.createQuery(hql); 
			qupdate.setParameter("m_object1", m_object_s[0]);
			qupdate.setParameter("m_object2", m_object_s[1]);
			qupdate.setParameter("id", id);
			qupdate.setParameter("reply", reply);
			qupdate.setParameter("r_content", r_content);
			qupdate.setParameter("r_time", r_time);
		}else{
			hql ="update Message set reply = :reply, r_content = :r_content, r_time = :r_time where id = :id";

			//给各字段赋值
			qupdate =session.createQuery(hql); 
			qupdate.setParameter("id", id);
			qupdate.setParameter("reply", reply);
			qupdate.setParameter("r_content", r_content);
			qupdate.setParameter("r_time", r_time);
		}
		int i=qupdate.executeUpdate();
		if(i!=0){
			fleat = true;
		}
		return fleat;
	}
	
	//修改标志变量
	public boolean getUpdate(int id ){
		//第一种方法的修改
		/*
				//选取所要操作的列
				student =(Student) session.get(Student.class,"8103");
				//修改过后的值
				student.setNAME("谭永超");
				session.save(student);
		 */
		//第二种 ihql语句修改操作
		String hql ="update Message set status = 1 where id = :id";
		Query qupdate =session.createQuery(hql);
		qupdate.setParameter("id", id);
		//执行
		int i=qupdate.executeUpdate();
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
