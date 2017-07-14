package admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.dao.LoginDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//设置编码
		String user = new String(request.getParameter("user"));//获取用户名
		String password = new String(request.getParameter("password"));//获取密码
		System.out.println("username:" + user);
		System.out.println("password:" + password);
		try{
			LoginDao ld = new LoginDao();
			System.out.println(ld.login(user,password));
			if(ld.login(user,password)){
				System.out.println("登陆成功");
				String isLogin = "OK";
				//创建session对象
				HttpSession session = request.getSession(true);
				session.setAttribute("isLogin", isLogin);
				
				//修改代表登录状态的静态变量
				System.out.println("isLogin状态改变：" + isLogin);
				request.getRequestDispatcher("/admin/reply.jsp").forward(request, response);//跳转留言成功页面
			}else{
				//创建session对象
				HttpSession session = request.getSession(true);
				session.setAttribute("login_msg","对不起，账号或者密码错误");
				String isLogin = "WRONG";
				session.setAttribute("isLogin", isLogin);
				System.out.println("账号或密码错误");
				request.getRequestDispatcher("/admin/login.jsp").forward(request, response);//跳转留言成功页面
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("登陆失败");
		}
	}

}
