package admin.test;

import java.sql.SQLException;

import admin.dao.LoginDao;

public class Test {
	public static void main(String[] args) throws Exception {
		try {
			LoginDao ld = new LoginDao();
			System.out.println(ld.login("呵呵","呵呵"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
