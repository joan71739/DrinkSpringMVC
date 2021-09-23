package tw.store.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("StoreService")
@Transactional
public class StoreService {
	
	@Autowired
	private StoreDao sDao;
	
	//1.新增方法
	public boolean insert(Store s) {
		return sDao.insert(s);
	}
	
	//2.查詢方法
	public Store queryByuserid(String userid) {
		return sDao.queryByuserid(userid);
	}
	
	//3.修改方法
	public boolean updateItemByStuid(Store s) {
		return sDao.updateItemByStuid(s);
	}
	
	//4.刪除方法
	public boolean deleteByStuid(String userid) {
		return sDao.deleteByStuid(userid);
	}

}
