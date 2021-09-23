package tw.billhu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository("orderssItemDao")
public class OrderssItemDao {
    @Autowired
	private SessionFactory sessionFatory;
	
    public void InserOrderssItem(OrderssItem orderssitem) {
    	Session session= sessionFatory.openSession();
    	Transaction tx=null;
    	if(orderssitem!=null) {
    		tx=session.beginTransaction();
    		session.save(orderssitem);
    		tx.commit();  
    		session.close();
    	}
    } 
    
    


}
