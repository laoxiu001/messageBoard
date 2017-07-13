package admin.struts;

import javax.servlet.http.HttpSession;

import admin.dao.LoginDao;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private String user;
	private String password;
	public String index() {
		try{
			System.out.println(user);
			System.out.println(password);
			LoginDao ld = new LoginDao();
			System.out.println(ld.login(user,password));
			if(ld.login(user,password)){
				System.out.println("登陆成功");
				String isLogin = "OK";
				//修改代表登录状态的静态变量
				System.out.println("isLogin状态改变：" + isLogin);
				return "success";
			}else{
				//创建session对象
				System.out.println("账号或密码错误");
				return "wrong";
			}
		}catch(Exception e){
			e.printStackTrace();
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
