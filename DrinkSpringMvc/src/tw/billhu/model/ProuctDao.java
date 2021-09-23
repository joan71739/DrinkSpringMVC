package tw.billhu.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository("prouctDao")
public class ProuctDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Prouct> getAllProuct(){
		Session session= sessionFactory.openSession();
		Transaction tx=null;
		String hql="FROM Prouct";
		tx=session.beginTransaction();
		List<Prouct> prouct= session.createQuery(hql).getResultList();
		session.close();
		if(prouct!=null) {
			return prouct;
		}else { 
			return null;
		}
	}


	

}
