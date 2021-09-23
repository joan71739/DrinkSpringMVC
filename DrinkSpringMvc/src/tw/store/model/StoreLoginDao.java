package tw.store.model;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("StoreLoginDao")
@Transactional
public class StoreLoginDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
//	@Autowired
//	private StoreLogin StoreLogin;
	
	//1.檢核店家帳號密碼
	public boolean checkLogin(String stuserid, String stpassword) {
		
		// 2021/8/3 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();
		
		StoreLogin storeLogin = session.get(StoreLogin.class, stuserid);

		if (storeLogin != null) {
			if (storeLogin.getStpassword().equals(stpassword)) {
				
				// 2021/8/3 更動 
				session.close();
				return true;
			}
			// 2021/8/3 更動 
			session.close();
			return false;
		}
		// 2021/8/3 更動 
		session.close();
		return false;
	}
	
	
	//2.用店家帳號找統編
	public String getCompany(String stuserid) {
		
		// 2021/8/3 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();
		
		StoreLogin storeLogin = session.get(StoreLogin.class, stuserid);
		
		// 2021/8/3 更動 
		session.close();
		return storeLogin.getCompany();
	}
	
	
	//3.用統編查詢店家帳號
	@SuppressWarnings("unchecked")
	public ArrayList<Store> getUseridByCompany(String company) {
		
		
		Session session = sessionFactory.openSession();
		String hql = "SELECT stuserid FROM Login WHERE company = :company";
		ArrayList<Store> userids = (ArrayList<Store>) session.createQuery(hql)
								          .setParameter("company", company)
									      .getResultList();
		// 2021/8/3 更動 
		session.close();
		return userids;
	}
	
	
	
	
	
	
	

}
