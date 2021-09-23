package tw.store.model;

import java.io.Serializable;
import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("StoreDao")
@Transactional
public class StoreDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	// 1.新增方法
	public boolean insert(Store s) {
		
		// 2021/8/3 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();
		
		Serializable sta = session.save(s);

		if (sta != null) {
			// 2021/8/3 更動 
			session.close();
			return true;
		}
		// 2021/8/3 更動 
		session.close();
		return false;
	}

	// 2.查詢方法:使用店家帳號查詢資料

	public Store queryByuserid(String userid) {
		
		// 2021/8/3 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();

		String hql = "FROM Store WHERE stuserid = :userid";
		@SuppressWarnings("unchecked")
		ArrayList<Store> rs = (ArrayList<Store>) session.createQuery(hql).setParameter("userid", userid).getResultList();
				

		if (rs != null) {
			for (Store store : rs) {
				
				// 2021/8/3 更動 
				session.close();
				return store;
			}
		}
		
		// 2021/8/3 更動 
		session.close();
		return null;

	}

	// 3.修改方法
	
	public boolean updateItemByStuid(Store s) {
		
		// 2021/8/3 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();
		
		String hql = "UPDATE Store s SET s.title = :title , s.manager = :manager , s.stadd = :stadd , s.tel = :tel "
				+",s.intro = :intro,s.photo = :photo  WHERE s.stuserid = :stuserid";
		int sta = session.createQuery(hql)
			   .setParameter("title", s.getTitle())
			   .setParameter("manager", s.getManager())
			   .setParameter("stadd", s.getStadd())
			   .setParameter("tel", s.getTel())
			   .setParameter("intro", s.getIntro())
			   .setParameter("photo", s.getPhoto())
			   .setParameter("stuserid", s.getStuserid())
			   .executeUpdate();
		
		if(sta >= 1) {
			// 2021/8/3 更動 
			session.close();
			return true;
		}
		// 2021/8/3 更動 
		session.close();
		return false;
	}
	
	// 4.刪除方法
	
	public boolean deleteByStuid(String userid) {
		
		// 2021/8/3 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();
		
		
		String hql = "DELETE FROM Store s  WHERE s.stuserid = :stuserid";
		int sta = session.createQuery(hql)
						 .setParameter("stuserid",userid)
						 .executeUpdate();
		if(sta >= 1) {
			// 2021/8/3 更動 
			session.close();
			return true;
		}
		// 2021/8/3 更動 
		session.close();
		return false;
		
	}

}
