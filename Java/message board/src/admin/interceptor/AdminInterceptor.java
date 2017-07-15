package admin.interceptor;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AdminInterceptor extends AbstractInterceptor {
	/**
	 * 验证是否登录的拦截器
	 * login_sta = "OK"：已登录
	 * login_sta = "WRONG"：未登录
	 * */
	
	private static final long serialVersionUID = 1L;
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		//获取到请求的action名
		String actionName=invocation.getProxy().getActionName();
		System.out.println("actionName="+actionName);
		
		//拦截除了login.action以外的所有action
		if ("login".equals(actionName)) {
			 
			//通知调用后面的interceptor或者action
			return invocation.invoke();
		}
		
		//获取到actionContext
		 ActionContext actionContext=invocation.getInvocationContext();
		 
		//获取判断session中是否存在login_sta的值
		String login_sta=(String) invocation.getInvocationContext().getSession().get("login_sta");
		
		//登录失败
		if (login_sta != null) {
			if(login_sta == "WRONG"){
				System.out.println("登录状态为失败");
				return "login";
			}else{
				System.out.println("已经登录成功了哦");
			}
		}else{
			System.out.println("似乎没有登录哦");
			return "login";
		}
		return invocation.invoke();
	}
}
