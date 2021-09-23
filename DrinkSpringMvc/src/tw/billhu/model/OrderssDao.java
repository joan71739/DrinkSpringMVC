package tw.billhu.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("orderssDao")
public class OrderssDao {
	@Autowired
	private SessionFactory sessionFactory;

	public List<Orderss> getAllOrderss() {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		String hql = "FROM Orderss";
		tx = session.beginTransaction();
		Query query = session.createQuery(hql);
		List<Orderss> order = query.getResultList();
		if (order != null) {
			tx.commit();
			session.close();
			return order;
		} else {
			session.close();
			tx.rollback();

			return null;
		}
	}

	public List<Orderss> getOrderss(String begin, String end) throws ParseException {

		System.out.println(begin + "-" + end);
		String[] be = begin.split("-");
		String[] ed = end.split("-");

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		List<Orderss> order;
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Date date1 = null;
		Date date2 = null;

		date1 = simpleDateFormat.parse(be[2] + "/" + be[1] + "/" + be[0]);

		date2 = simpleDateFormat.parse(ed[2] + "/" + ed[1] + "/" + ed[0]);

		System.out.println(date1 + "-" + date2);
		String hql = "FROM Orderss WHERE shopDate>=:begin and shopDate<=:end";
		tx = session.beginTransaction();
		System.out.println(date1 + "-" + date2);
		order = session.createQuery(hql).setParameter("begin", date1).setParameter("end", date2).getResultList();
		if (order != null) {
			tx.commit();
			session.close();

			return order;

		} else {

			tx.rollback();
			session.close();

			return null;

		}

	}

	public int getOrderssID(int customerID, double total) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		String sql = "select OrderssID from Orderss where customerID=:customerid and total=:total";
		tx = session.beginTransaction();
		int orderssID = (int) session.createQuery(sql).setParameter("customerid", customerID).setParameter("total", total)
				.getSingleResult();

		if (orderssID > 0) {
			tx.commit();
			session.close();

			return orderssID;
		} else {
			tx.rollback();			
			session.close();

			return -1;
		}
	}
 
	public void InsertOrderss(Orderss order) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		if (order != null) {
			tx = session.beginTransaction();
			session.save(order);
			tx.commit();
			session.close();

		}
	}

}
