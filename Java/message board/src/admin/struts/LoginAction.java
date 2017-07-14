package admin.struts;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import admin.dao.LoginDao;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private String user;
	private String password;
	public String execute() {
		try{
			System.out.println(user);
			System.out.println(password);
			LoginDao ld = new LoginDao();
			if(ld.login(user,password)){
				System.out.println("登陆成功");
				//修改代表登录状态的静态变量
				ServletActionContext.getRequest().getSession().setAttribute("login_sta", "OK");
				System.out.println("LoginAction中login_sta状态：" + "OK");
				return "success";
			}else{
				//创建session对象
				System.out.println("账号或密码错误");
				ServletActionContext.getRequest().getSession().setAttribute("login_sta", "WRONG");
				ServletActionContext.getRequest().getSession().setAttribute("login_msg", "对不起，账号或者密码错误，登录失败");
				System.out.println("LoginAction中login_sta状态：" + "WRONG");
				return "wrong";
			}
		}catch(Exception e){
			e.printStackTrace();
			ServletActionContext.getRequest().getSession().setAttribute("login_sta", "WRONG");
			ServletActionContext.getRequest().getSession().setAttribute("login_msg", "对不起，服务器异常数据，登录失败");
			System.out.println("login_sta状态改变：" + "WRONG");
			System.out.println("登陆失败");
			return "wrong";
		}
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
