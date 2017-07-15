package admin.struts;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport{
	public String execute() {
		//注销成功返回注销“成功”结果集
		System.out.println("注销成功");
		//提示用户已经注销
		ServletActionContext.getRequest().getSession().setAttribute("login_msg", "您已成功注销");
		
		//防止创建Session
		ServletActionContext.getRequest().getSession(false);
		//设置login_sta为WRONG
		ServletActionContext.getRequest().getSession().setAttribute("login_sta", "WRONG");
		return "success";
	}
}
