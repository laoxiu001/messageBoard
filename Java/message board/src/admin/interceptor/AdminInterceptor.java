package admin.interceptor;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
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
		//获取session对象
		HttpSession session = ServletActionContext.getRequest().getSession();
		//获取用户登录状态
		String login_sta = (String) session.getAttribute("login_sta");
		
		//登录失败
		if (login_sta == null || !login_sta.equals("OK")) {
			System.out.println("用户未登录，访问了禁止的后台");
			System.out.println("拦截器中login_sta状态为：" + login_sta);
			session.setAttribute("login_msg", "对不起，请先登录");
			return Action.LOGIN;
		}else{
			//用户已登录，拦截器通过
			System.out.println("拦截器中login_sta状态为：" + login_sta);
			System.out.println("用户已登录，拦截器通过");
			return invocation.invoke();
		}
		// 方法在拦截器被垃圾回收之前调用，用来回收init方法初始化的资源
	}
}
