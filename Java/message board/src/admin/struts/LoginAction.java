package admin.struts;

import hibernate.utile.HibUtility;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import admin.dao.LoginDao;
import admin.dao.Message;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements RequestAware{
	/**
	 * 此处是登陆权限验证
	 * 和留言列表显示数据Action
	 */
	private static final long serialVersionUID = 1L;
	private StringBuffer sb;
	private String page;//当前页数
	private String user;
	private String password;
	private String theNextPage;
	private String previousPage;
	private String shouPage;
	private String moPage;
	private int id ;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	int p = 1 ;//查询记录的页数
	public int getP() {
		return p;
	}
	public void setP(int p) {
		this.p = p;
	}
	public String getTheNextPage() {
		return theNextPage;
	}
	public void setTheNextPage(String theNextPage) {
		this.theNextPage = theNextPage;
	}
	public String getPreviousPage() {
		return previousPage;
	}
	public void setPreviousPage(String previousPage) {
		this.previousPage = previousPage;
	}
	Map<String,Object> map = null;
	public String getShouPage() {
		return shouPage;
	}
	public void setShouPage(String shouPage) {
		this.shouPage = shouPage;
	}
	public String getMoPage() {
		return moPage;
	}
	public void setMoPage(String moPage) {
		this.moPage = moPage;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	public StringBuffer getSb() {
		return sb;
	}
	public void setSb(StringBuffer sb) {
		this.sb = sb;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
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
	//数据删除方法
	public String delete(){
		HibUtility hib = new HibUtility();
		hib.getSession();
		if(hib.getDelete(getId())){
			map.put("ts_1", "第"+id+"条消息被删除");
		}
		List<Message> list = hib.getSelect(p-1);
		hib.allclose();
		map.put("sss", this);
		ActionContext.getContext().put("list", list);
		return "success";
	}
	public String pagingQuery() throws Exception{
		int count = 1;//	查询总记录数
		HibUtility hib = new HibUtility();
		hib.getSession();
		if(page != null){
			p = Integer.parseInt(page);
		}
		if(getTheNextPage() !=null){
			if(getTheNextPage().equals("下一页")){
				if(p<=hib.count()/10){
					p=p+1;
				}else{
					map.put("ts_1", "末页");
				}
			}
		}else
			if(getPreviousPage() !=null){
				if(getPreviousPage().equals("上一页")){
					if(p>1){
						p=p-1;
					}else{
						map.put("ts_2", "首页");
					}
				}
			}
		if(getShouPage() != null){
			if(getShouPage().equals("首页")){
			p = 1;
			map.put("ts_2", "首页");
			}
		}
		if(getMoPage() !=null){
			if(getMoPage().equals("末页")){
				p = hib.count()/10+1;
				map.put("ts_1", "末页");
			}
		}
		map.put("sss",this);
		System.out.println("p="+p);
		List<Message> list = hib.getSelect(p-1);
		hib.allclose();
		ActionContext.getContext().put("list", list);
		return "success";
	}
	public String execute() {
		try{
			System.out.println("LoginAction中：");
			System.out.println(user);
			System.out.println(password);
			LoginDao ld = new LoginDao();
			if(ld.login(user,password)){
				System.out.println("登陆成功");
				//修改代表登录状态的静态变量
				ServletActionContext.getRequest().getSession().setAttribute("login_sta", "OK");
				System.out.println("LoginAction中login_sta状态：" + "OK");
				HibUtility hib = new HibUtility();
				hib.getSession();
				List<Message> list = hib.getSelect(0);
				hib.allclose();
				/*			    int count = 1;//	查询总记录数
			    for (Message l : list) {
			    	count++;
				}
				int currpagr = 1;//当前页
				//getParameter(page):获取指定名称的参数值。这是最为常用的方法之一。
				if(page!= null){
					//Integer.parseInt将字符串类型的转换为int
					currpagr = Integer.parseInt(page);
					System.out.println(page);
				} else{
					System.out.println("page 为空");
				}
			    int pages;//总页数
				if(count%12==0){
					pages = count/12;
				}else{
					pages = count/12+1;
				}
				 sb = new StringBuffer();
				//通过循环构建分页条
				System.out.println("pages" +pages);
				for(int i = 1;i<=pages;i++ ){
					//判断是否为当前页
					if(i == currpagr){
						//append追加内容到当前StringBuffer对象的末尾
						sb.append("["+i+"]");//构建分页条
					}else{
						sb.append("<a href='login'name='Page?"+i+")}'>"+i+"</a>");
					}
					sb.append(" ");
				}*/
				map.put("sss",this);
				ActionContext.getContext().put("list", list);
				return "success";
			}else{
				//创建session对象
				System.out.println("账号或密码错误");
				ServletActionContext.getRequest().getSession().setAttribute("login_sta", "WRONG");
				ServletActionContext.getRequest().getSession().setAttribute("login_msg", "对不起，账号或者密码错误，登录失败");
				System.out.println("LoginAction中login_sta状态：" + "WRONG");
				return "wrong";
			}
		}catch(Exception e){
			e.printStackTrace();
			ServletActionContext.getRequest().getSession().setAttribute("login_sta", "WRONG");
			ServletActionContext.getRequest().getSession().setAttribute("login_msg", "对不起，服务器异常数据，登录失败");
			System.out.println("login_sta状态改变：" + "WRONG");
			System.out.println("登陆失败");
			return "wrong";
		}

	}

	@Override
	public void setRequest(Map<String, Object> map) {
		// TODO Auto-generated method stub
		this.map = map;

	}
}
