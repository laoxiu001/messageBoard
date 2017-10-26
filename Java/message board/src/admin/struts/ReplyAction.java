package admin.struts;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import admin.dao.Message;
import hibernate.utile.HibUtility;

public class ReplyAction extends ActionSupport implements RequestAware{
	/*
	 * 此处是显示指定
	 * */
	private int id;//留言id
	private String reply;//受理单位
	private String r_content;//回复内容
	private String m_object;//留言对象
	Map<String,Object> map = null ;
	String session = null ;
	
	public int getId() {
		return id;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public String getSession() {
		return session;
	}

	public void setSession(String session) {
		this.session = session;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getM_object() {
		return m_object;
	}

	public void setM_object(String m_object) {
		this.m_object = m_object;
	}

	public String showMessage(){
		System.out.println("ReplyAction方法开始");
		session = ServletActionContext.getRequest().getSession().getAttribute("user").toString();
		//获取session对象
		HibUtility hib = new HibUtility();
		hib.getSession();
		//将结果集存入list
		List<Message> list = hib.getMessage(id);
		hib.getUpdate(id);
		hib.allclose();
		ActionContext.getContext().put("list", list);
		//获取session对象
		HibUtility hib_1 = new HibUtility();
		hib_1.getSession();
		//将结果集存入list
		hib_1.getUpdate(id);
		hib_1.allclose();
		map.put("sss", this);
		System.out.println("ReplyAction方法结束");
		return "success";
	}
	
	public String modify(){
			HibUtility hib = new HibUtility();
			hib.getSession();
			hib.getUpdate(id,reply,r_content,m_object);
			hib.allclose();
			System.out.println("--------------------------------");
			System.out.println(m_object);
			map.put("sss", this);
			return "success";
	}

	@Override
	public void setRequest(Map<String, Object> map) {
		// TODO Auto-generated method stub
		this.map = map ;
	}
}
