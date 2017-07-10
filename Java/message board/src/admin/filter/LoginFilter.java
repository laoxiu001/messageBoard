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

public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain fc) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) request).getSession(true);
		String isLogin = (String)session.getAttribute("isLogin");
		if(isLogin==null||!isLogin.equals("OK")){
			System.out.println("当前isLogin状态为：" + isLogin + "用户未登录");
			((ServletRequest) request).getRequestDispatcher("/admin/login.jsp").forward(request, response);
		}else{
			System.out.println("当前isLogin状态为：" + isLogin + "用户登录成功");
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
