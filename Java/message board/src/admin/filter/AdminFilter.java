package admin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class AdminFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain fc) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) request).getSession(true);
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
		System.out.println("LoginFilter销毁");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("LoginFilter创建");
	}

}
