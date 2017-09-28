package admin.struts;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import admin.dao.Message;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GetMessageAction extends ActionSupport {
/*
 * 这是管理员页面获取留言内容Action
 * 用于管理员后台显示留言列表
 * */
	public String execute() {
		// 获取Hibernate的配置对象
		Configuration configuration = new Configuration().configure();
		// 建立SessionFactory
		SessionFactory sessionFactory = configuration.buildSessionFactory();
		// 打开session
		Session session = sessionFactory.openSession();

		// 创建Test对象并赋值
		Message m = new Message();

		// HQL语句
		String sql = "select * from Message";
		SQLQuery sqlQuery = session.createSQLQuery(sql)
				.addEntity(Message.class);

		List<Message> list = sqlQuery.list();// java.util包

		HttpServletRequest request = ServletActionContext.getRequest();
		ActionContext.getContext().put("list", list);
		return "success";
	}
}
