package admin.struts;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import admin.dao.Message;
import hibernate.utile.HibUtility;

public class ReplyAction extends ActionSupport{
	/*
	 * 此处是显示指定
	 * */
	private int id;//留言id
	private String reply;//受理单位
	private String r_content;//回复内容
	private String m_object;//留言对象
	

	
	public int getId() {
		return id;
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
		HibUtility hib = new HibUtility();
		hib.getSession();
		List<Message> list = hib.getMessage(id);
		hib.allclose();
		ActionContext.getContext().put("list", list);
		return "success";
	}
	
	public String modify(){
			HibUtility hib = new HibUtility();
			hib.getSession();
			hib.getUpdate(id,reply,r_content,m_object);
			hib.allclose();
			
			System.out.println("--------------------------------");
			System.out.println(m_object);
			
			return "success";
	}
}
