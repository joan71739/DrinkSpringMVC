package activity.model;

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
public class ActivityDao {
	
	@Autowired // 幫我找 Session 工廠
	private SessionFactory sessionFactory; 
	
	// 新增一筆活動
	public void insertActivity(ActivityBean activityBean) {
		
		Session session = sessionFactory.openSession(); 
		
		session.save(activityBean);
		System.out.println("一筆資料 insert 成功");

		session.close();
	}
	
	
	// 查詢所有活動
	public List<ActivityBean> queryAllActivity() {
		
		Session session = sessionFactory.openSession();
		
		String hql = "From ActivityBean";
		Query<ActivityBean> query = session.createQuery(hql, ActivityBean.class);
		List<ActivityBean> result = query.getResultList();
		
		session.close();
		
		return result;
		
	}
	
	// 查詢單一活動
	public ActivityBean queryOneActivity(int ID) {
		
		Session session = sessionFactory.openSession();
		
		ActivityBean result = session.get(ActivityBean.class, ID);
		
		session.close();
		
		return result;
		
	}
	
	// 修改活動
	public void updateActivity(ActivityBean activityBean) {
		
		Session session = sessionFactory.openSession(); 
		
		Transaction tx = session.beginTransaction();
		session.update(activityBean);
		tx.commit();
		
		System.out.println("修改一筆資料成功");
		
		session.close();
	}
	
	// 刪除活動
	public void deleteActivity(int ID) {
		
		Session session = sessionFactory.openSession(); 
		
		Transaction tx = session.beginTransaction();
		ActivityBean bean = session.get(ActivityBean.class, ID );
		session.delete(bean);
		tx.commit();
		
		System.out.println("刪除一筆資料成功");
		
		session.close();
	}

//  備用
//	ActivityBean bean = session.get(ActivityBean.class, activityBean.getID());
//	bean.setActivityTopic( activityBean.getActivityTopic() );
//	bean.setStartTime( activityBean.getStartTime() );
//	bean.setEndTime( activityBean.getEndTime() );
//	bean.setActivityContent( activityBean.getActivityContent() );
}
