package admin.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.dao.DeleteDao;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");// 设置编码
		String user_id = new String(request.getParameter("id"));// 获取留言ID
		int id = Integer.parseInt(user_id);// 将留言ID字符串转换为INT类型

		try {
			DeleteDao dd = new DeleteDao();
			int n = dd.del(id);
			if (n > 0) {
				HttpSession session = request.getSession(true);
				session.setAttribute("msg", "恭喜，留言删除成功");
				System.out.println("msg状态改变：恭喜，留言删除成功");
			}

		} catch (ClassNotFoundException | SQLException e) {
			HttpSession session = request.getSession(true);
			session.setAttribute("msg", "对不起，留言删除失败");
			System.out.println("msg状态改变：对不起，留言删除失败");
		}finally{
			//跳转回复留言页面
			request.getRequestDispatcher("/admin/reply.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
