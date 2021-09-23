package tw.kuziwu.model;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DiscussService {
	
	@Autowired
	private DiscussDao DiscussDao;

	// 新增
	public void insertDiscuss( DiscussBean discussBean ) {
		System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
		DiscussDao.insertDiscuss(discussBean);
		
	}

	// 查詢所有
	public List<DiscussBean> queryAllDiscuss() {
		List<DiscussBean> result = DiscussDao.queryAllDiscuss();
		return result;
	}

	// 查詢單一
	public DiscussBean queryOneDiscuss(int ID) {
		DiscussBean result = DiscussDao.queryOneDiscuss(ID);
		return result;
	}
	
	// 修改
	public void updateActivity(DiscussBean activityBean) {
		System.out.println("經過Update.Service");
		DiscussDao.updateDiscuss(activityBean);
	}
	
	// 刪除
	public void deleteActivity(int ID) {
		DiscussDao.deleteDiscuss(ID);
	}
	
	
}

