package tw.kuziwu.model;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository // 註冊 Dao 元件
@Transactional
public class DiscussDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	// 新增
	public void insertDiscuss(DiscussBean discussBean) {
		
		// 2021/8/4 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();

		if (discussBean != null) {
			session.save(discussBean);
			System.out.println("一筆資料 insert 成功");
			
			// 2021/8/4 更動
			session.close();
			}
		
	}
	
	// 查詢所有
	public List<DiscussBean> queryAllDiscuss() {
		
		// 2021/8/4 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();
		
		String hql = "From DiscussBean"; // 查詢所有活動
		
		Query<DiscussBean> query = session.createQuery(hql, DiscussBean.class);
		List<DiscussBean> result = query.getResultList();
		
		// 2021/8/4 更動
		session.close();
		
		return result;
		
	}
	
	// 查詢單一
	public DiscussBean queryOneDiscuss(int ID) {
		
		// 2021/8/4 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();
		
		String hql = "FROM ActivityBean a WHERE a.ID = :ID"; // 查詢單一活動 By ID
		
		Transaction tx = session.beginTransaction(); // 手動開啟交易
		
		Query<DiscussBean> query = session.createQuery(hql, DiscussBean.class);
		query.setParameter("ID", ID);
		DiscussBean result = query.getSingleResult();
		
		tx.commit(); // 手動關交易
		
		// 2021/8/4 更動
		session.close();
		
		return result;
		
	}
	
	// 修改
	public void updateDiscuss(DiscussBean discussBean) {
		
		// 2021/8/4 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		DiscussBean bean = session.get(DiscussBean.class, discussBean.getDiscussId());
		bean.setShopName(discussBean.getShopName());
		bean.setDrink(discussBean.getDrink());
		bean.setDrinkstar(discussBean.getDrinkstar());
		bean.setDrinkDiscuss(discussBean.getDrinkDiscuss());
		tx.commit();
		
		// 2021/8/4 更動
		session.close();
		
		System.out.println("修改一筆資料成功");
		
	}
	
	// 刪除
	public void deleteDiscuss(int ID) {
		
		// 2021/8/4 更動 getCurrentSession -> openSession
		Session session = sessionFactory.openSession();
//		Session session = sessionFactory.getCurrentSession();
		
		Transaction tx = session.beginTransaction(); // 手動開啟交易
		
		DiscussBean bean = session.get(DiscussBean.class, ID );

		session.delete(bean);
		
		tx.commit(); // 手動關交易
		
		// 2021/8/4 更動
		session.close();
				
		System.out.println("刪除一筆資料成功");
		
	}
}


