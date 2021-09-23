package tw.store.model;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("StoreLoginDaoService")
@Transactional
public class StoreLoginDaoService {
	
	@Autowired
	private StoreLoginDao stLoginDao;

	//1.檢核店家帳號密碼
	public boolean checkLogin(String stuserid, String stpassword) {
		return stLoginDao.checkLogin(stuserid, stpassword);
	}
	
	//2.使用帳號找尋店家統編
	public String getCompany(String stuserid) {
		return stLoginDao.getCompany(stuserid);
	}
	
	//3.統編找店家帳號
	public ArrayList<Store> getUseridByCompany(String company){
		return stLoginDao.getUseridByCompany(company);
	}
	
}
