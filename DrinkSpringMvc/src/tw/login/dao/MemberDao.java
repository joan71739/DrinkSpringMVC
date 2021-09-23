package tw.login.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.login.bean.SQLMemberData;
import tw.login.bean.SQLMemberDataVendor;
import tw.login.bean.SQLMemberID;

@Repository("memberDao")
@Transactional
public class MemberDao { 

	@Autowired
	private SessionFactory sessionFactory;

	// 搜尋帳號
	public SQLMemberID searchMemberID(String userID) {
		Session session = sessionFactory.openSession();
		SQLMemberID res = session.get(SQLMemberID.class, userID);
		session.close();
		return res;
	}

	// 搜尋一般會員
	public SQLMemberData searchMemberData(String userID) {
		Session session = sessionFactory.openSession();
		SQLMemberData res = session.get(SQLMemberData.class, userID);
		session.close();
		return res;
	}

	// 搜尋企業會員
	public SQLMemberDataVendor searchMemberDataVendor(String userID) {
		Session session = sessionFactory.openSession();
		SQLMemberDataVendor res = session.get(SQLMemberDataVendor.class, userID);
		session.close();
		return res;
	}

	// 更新帳號
	public void updateMemberID(SQLMemberID mem) {
		Session session = sessionFactory.openSession();
		session.update(mem);
		session.flush();
		session.close();
	}

	// 更新帳號
	public void updateMemberData(SQLMemberData mem) {
		Session session = sessionFactory.openSession();
		session.update(mem);
		session.flush();
		session.close();
	}

	// 更新帳號
	public void updateMemberDataVendor(SQLMemberDataVendor mem) {
		Session session = sessionFactory.openSession();
		session.update(mem);
		session.flush();
		session.close();
	}

	// 新增會員帳號
	public void iniserMemberID(SQLMemberID mem) {
		Session session = sessionFactory.openSession();
		session.save(mem);
		session.flush();
		session.close();
	}

	// 新增一般會員資料
	public void iniserMemberData(SQLMemberData mem) {
		Session session = sessionFactory.openSession();
		session.save(mem);
		session.flush();
		session.close();
	}

	// 新增企業會員資料
	public void iniserMemberDataVendor(SQLMemberDataVendor mem) {
		Session session = sessionFactory.openSession();
		session.save(mem);
		session.flush();
		session.close();
	}

	// 刪除會員帳號
	public void deleteMemberID(String userID) {
		Session session = sessionFactory.openSession();
		SQLMemberID memID = session.get(SQLMemberID.class, userID);
		session.delete(memID);
		session.flush();
		session.close();
	}

	// 刪除一般會員資料
	public void deleteMemberData(String userID) {
		Session session = sessionFactory.openSession();
		SQLMemberData memID = session.get(SQLMemberData.class, userID);
		session.delete(memID);
		session.flush();
		session.close();
	}

	// 刪除企業會員資料
	public void deleteMemberDataVendor(String userID) {
		Session session = sessionFactory.openSession();
		SQLMemberDataVendor memID = session.get(SQLMemberDataVendor.class, userID);
		session.delete(memID);
		session.flush();
		session.close();
	}
}
