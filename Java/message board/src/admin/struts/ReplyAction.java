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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String showMessage(){
		System.out.println("ReplyAction方法开始");
		
		//获取session对象
		HibUtility hib = new HibUtility();
		hib.getSession();
		
		//将结果集存入list
		List<Message> list = hib.getMessage(id);
		hib.allclose();
		ActionContext.getContext().put("list", list);
		
		System.out.println("ReplyAction方法结束");
		return "success";
	}
}
