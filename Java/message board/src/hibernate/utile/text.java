package hibernate.utile;

import org.hibernate.Session;

public class text {
	public static void main(String[] args) {
		HibUtility hu = new HibUtility();
		hu.getSession();
		hu.getUpdate("6", 7);
		hu.allclose();
	}
	
	
}
