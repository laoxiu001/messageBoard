package user.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;

import user.entity.ListEntity;
import user.util.SensitivewordFilter;
import user.dao.BaseDao;
import user.dao.PublishDao;

/**
 * Servlet implementation class PublishServlet
 */
@WebServlet("/PublishServlet")
public class PublishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublishServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 发表留言servlet
		 * */
		ListEntity listEntity = new ListEntity();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			request.setCharacterEncoding("UTF-8");//设置编码
			String user = new String(request.getParameter("user"));//获取用户名
			String number = new String(request.getParameter("number"));//获取学号
			String title = new String(request.getParameter("title"));//获取标题
			String type = new String(request.getParameter("type"));//获取留言类型
			String m_content = new String(request.getParameter("m_content"));//获取留言内容
			String m_object_l = new String(request.getParameter("m_object"));//获取留言对象（学院，数学与财经学院）

			if(user.equals("")){
				request.setAttribute("result","用户名不能为空！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(user.length()>5){
				request.setAttribute("result","用户名不能超过5字符！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(number.equals("")){
				request.setAttribute("result","学号不能为空！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(number.length()>20){
				request.setAttribute("result","学号不能超过20字符！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(title.equals("")){
				request.setAttribute("result","标题不能为空！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(title.length()>10){
				request.setAttribute("result","标题不能超过10字符！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(type.equals("")){
				request.setAttribute("result","留言类型不能为空！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(type.equals("点我选择")){
				request.setAttribute("result","请选择留言类型！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(m_object_l.equals("")){
				request.setAttribute("result","留言对象不能为空！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(m_object_l.equals("false,false")){
				request.setAttribute("result","请选择正确的留言对象！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(m_content.equals("")){
				request.setAttribute("result","留言内容不能为空！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else if(m_content.length()>400){
				request.setAttribute("result","内容不能超过400字符！");
				request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
			}else{

				SensitivewordFilter filter = new SensitivewordFilter();
				Set<String> set_user = filter.getSensitiveWord(user, 1);
				Set<String> set_number = filter.getSensitiveWord(number, 1);
				Set<String> set_title = filter.getSensitiveWord(title, 1);
				Set<String> set_content = filter.getSensitiveWord(m_content, 1);
				if(set_user.size()>0){
					request.setAttribute("result","用户名含有敏感词"+set_user);
					request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
				}else if(set_number.size()>0){
					request.setAttribute("result","学号含有敏感词"+set_number);
					request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
				}else if(set_title.size()>0){
					request.setAttribute("result","留言标题含有敏感词"+set_title);
					request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
				}else if(set_content.size()>0){
					request.setAttribute("result","留言内容含有敏感词"+set_content);
					request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
				}else if(isRepeatSubmit(request)){
					//用户重复提交
					request.setAttribute("result","请勿重复提交");
					System.out.println();
					request.getRequestDispatcher("/result/Message_wrong.jsp").forward(request, response);//跳转留言失败页面
				}else{
					String [] m_object=m_object_l.split(",");//将获取的留言对象从“，”分割
					//将面板获取的数据存入实体类
					listEntity.setUser(user);
					listEntity.setNumber(number);
					listEntity.setTitle(title);
					listEntity.setType(type);
					listEntity.setM_content(m_content);
					listEntity.setM_object1(m_object[0]);
					listEntity.setM_object2(m_object[1]);

					conn=(Connection) BaseDao.getConn();//获取数据库连接
					PublishDao pd = new PublishDao();//创建留言操作数据库对象
					//发表不成功或者更新1条以上记录
					int n = pd.publish(conn, listEntity);//发表操作更新数据库，返回1即成功
					if(n==1){
						request.setAttribute("id",pd.id);//存储留言编号，待面板读取展示给用户
						request.getRequestDispatcher("/result/Message_success.jsp").forward(request, response);//跳转留言成功页面
						request.getSession().removeAttribute("token");//移除session中的token
					}
				}
				//发表留言
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			BaseDao.closeAll(conn, pstmt, rs);
		}
	}
	
	private boolean isRepeatSubmit(HttpServletRequest request) {
		String client_token = request.getParameter("token");
		//1、如果用户提交的表单数据中没有token，则用户是重复提交了表单
		if(client_token==null){
			System.out.println("用户提交的表单数据中没有token");
			return true;
		}
		//取出存储在Session中的token
		String server_token = (String) request.getSession().getAttribute("token");
		//2、如果当前用户的Session中不存在Token(令牌)，则用户是重复提交了表单
		if(server_token==null){
			System.out.println("当前用户的Session中不存在Token(令牌)");
			return true;
		}
		//3、存储在Session中的Token(令牌)与表单提交的Token(令牌)不同，则用户是重复提交了表单
		if(!client_token.equals(server_token)){
			System.out.println("存储在Session中的Token(令牌)与表单提交的Token(令牌)不同");
			return true;
		}

		return false;
	}
	
}

