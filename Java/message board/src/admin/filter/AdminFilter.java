package admin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.FilterConfig;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import admin.struts.LoginAction;

public class AdminFilter implements Filter {
	 public FilterConfig config;
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain fc) throws IOException, ServletException {
		HttpServletRequest hrequest = (HttpServletRequest)request;
		HttpSession session = ((HttpServletRequest) request).getSession(true);
		LoginAction l = new LoginAction();
		String logonStrings = "/admin/login.jsp;login"; //不过滤的页面地址
		String[] logonList = logonStrings.split(";");
		if (this.isContains(hrequest.getRequestURI(), logonList)) {// 对登录页面不进行过滤
			  fc.doFilter(request, response);
			   return;
			  }
		String login_sta = (String)session.getAttribute("login_sta");
		if(login_sta==null||!login_sta.equals("OK")){
			System.out.println("AdminFilter中的login_sta：" + login_sta + "用户未登录");
			session.setAttribute("login_msg", "您好，请先登录");
			((ServletRequest) request).getRequestDispatcher("/admin/login.jsp").forward(request, response);
		}else{
			System.out.println("AdminFilter中的login_sta：" + login_sta + "用户登录成功");
			fc.doFilter(request, response);
		}
	}
	@Override
	public void destroy() {
		this.config = null;
		System.out.println("LoginFilter销毁");
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("LoginFilter创建");
	}
	 public static boolean isContains(String container, String[] regx) {
		  boolean result = false;
		  for (int i = 0; i < regx.length; i++) {
		   if (container.indexOf(regx[i]) != -1) {
		    return true;
		   }
		  }
		  return result;
		 }
}

