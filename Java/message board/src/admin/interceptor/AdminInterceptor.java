package admin.interceptor;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AdminInterceptor extends AbstractInterceptor {
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//获取session对象
		HttpSession session = ServletActionContext.getRequest().getSession();
		//获取用户登录状态
		String login_sta = (String) session.getAttribute("login_sta");
		
		// 如果没有登陆，或者登陆所有的用户名不是yuewei，都返回重新登陆
		if (login_sta == null || !login_sta.equals("OK")) {
			System.out.println("用户未登录，访问了禁止的后台");
			session.setAttribute("login_msg", "对不起，请先登录");
			return Action.LOGIN;
		}
		//跳转返回登录页面
		return invocation.invoke();
	}
}
