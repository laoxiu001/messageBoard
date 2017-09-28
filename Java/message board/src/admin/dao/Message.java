package admin.dao;

public class Message {
	/*
	 * 用户留言数据库映射实体类
	 * */
	int id;//编号
	String type;//类型
	String title;//标题
	String m_content;//内容
	String m_time;//留言时间
	String click;//点击率
	String user;//用户
	String number;//学号
	String reply;//回复单位
	String r_content;//回复内容
	String r_time;//回复时间
	String m_object1;//留言对象（校长、部门、学院）
	String m_object2;//具体留言对象
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public String getM_time() {
		return m_time;
	}
	public void setM_time(String m_time) {
		this.m_time = m_time;
	}
	public String getClick() {
		return click;
	}
	public void setClick(String click) {
		this.click = click;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_time() {
		return r_time;
	}
	public void setR_time(String r_time) {
		this.r_time = r_time;
	}
	public String getM_object1() {
		return m_object1;
	}
	public void setM_object1(String m_object1) {
		this.m_object1 = m_object1;
	}
	public String getM_object2() {
		return m_object2;
	}
	public void setM_object2(String m_object2) {
		this.m_object2 = m_object2;
	}
}
